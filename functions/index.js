/* eslint-disable max-len */
/* eslint-disable indent */
/* eslint-disable indent, object-curly-spacing */
/* eslint-disable require-jsdoc */

const admin = require("firebase-admin");
const { getFirestore, Timestamp, Filter } = require("firebase-admin/firestore");
const { onDocumentUpdated } = require("firebase-functions/v2/firestore");
const { onDocumentCreated } = require("firebase-functions/v2/firestore");
const { onCall } = require("firebase-functions/v2/https");
const { onSchedule } = require("firebase-functions/v2/scheduler");

admin.initializeApp();
const db = getFirestore();

exports.createUser = onCall({region: "europe-west3"},
    async (request) => {
      try {
        const payload = request.data;
        const email = payload.email;
        const password = payload.password;
        console.log("Payload:", payload);
        console.log("Received email:", email);
        console.log("Received password:", password);
        const user = await admin.auth().createUser({
          email: email,
          password: password,
        });
        await admin.auth().setCustomUserClaims(user.uid, {admin: true});
        return {uid: user.uid};
      } catch (error) {
        console.log("error deleting user", error);
      }
    });

exports.onItemUpdate = onDocumentUpdated({
  region: "europe-west3",
  document: "items/{id}",
}, async (event) => {
  const oldData = event.data.before.data();
  const newData = event.data.after.data();
  const oldStatus = oldData.status;
  const quantity = newData.quantity;
  const id = newData.id;
  const name = newData.name;
  const branch = newData.branch;
  const minimumQuantity = newData.minimumQuantity;

  const getItemStatus = (quantity, minimumQuantity) => {
    if (quantity <= 0) {
      quantity = 0;
      return "OUT-OF-STOCK";
    } else if (quantity > 0 && quantity < minimumQuantity) {
      return "LOW-STOCK";
    } else {
      return "IN-STOCK";
    }
  };

  const newStatus = getItemStatus(quantity, minimumQuantity);

  if (newStatus !== oldStatus) {
    const itemRef = event.data.after.ref;
    await itemRef.update({ status: newStatus });

    let titleEn = "";
    let titleAr = "";
    let bodyEn = "";
    let bodyAr = "";

    if (newStatus == "OUT-OF-STOCK") {
         titleEn = "❗️Urgent Alert.";
         titleAr = `❗️تنبيه عاجل.`;
         bodyEn = `The item ${name} is completely out of stock. It must be restocked as soon as possible to avoid operational disruptions.`;
         bodyAr = `الصنف ${name} نفد من المخزون بالكامل، يجب توفيره في أسرع وقت لتفادي تعطل العمليات.`;
    } else if (newStatus == "LOW-STOCK") {
        titleEn = `⚠️ Low Stock Warning.`;
        titleAr = `⚠️تنبيه انخفاض المخزون.`;
        bodyEn = `The item ${name} is running low on stock. Please restock it soon to avoid shortages.`;
        bodyAr = `الصنف ${name} في المخزون منخفض. يرجى توفيره قريبًا لتجنب النفاد.`;
      } else {
       return;
     }

    const notificationData = {
      type: "ITEM",
      id: id,
     };
    await sendNotification({
      titleEn,
      bodyEn,
      titleAr,
      bodyAr,
      notificationData,
      branch,
    });
  }

  return null;
});

/**
 * Generates a custom token for a given user ID.
 */
exports.generateCustomToken = onCall({ region: "europe-west3" },
  async (request) => {
    const payload = request.data;
    const uid = payload.uid;
    try {
      const token = await admin.auth().createCustomToken(uid);
      console.log("Custom Token:", token);
      return token;
    } catch (error) {
      console.error("Error creating custom token:", error);
      throw error;
    }
  });

exports.onTaskCreated = onDocumentCreated(
  {
    document: "branches/{branchId}/tasks/{taskId}",
  },
  async (event) => {
    try {
      const task = event.data.data();
      if (!task) return;

      const branch = task.branch;
      const taskName = task.title;
      const startTime = task.startTime;

      const formattedStartTimeEn = new Intl.DateTimeFormat("en-US", {
        dateStyle: "medium",
        timeStyle: "short",
      }).format(startTime.toDate());

      const formattedStartTimeAr = new Intl.DateTimeFormat("ar-EG", {
        dateStyle: "medium",
        timeStyle: "short",
      }).format(startTime.toDate());

      const titleEn = "📝 New Task Assigned";
      const titleAr = "📝 مهمة جديدة";
      const bodyEn = `A new task ${taskName} has been assigned to start at ${formattedStartTimeEn}.`;
      const bodyAr = `تم تعيين المهمة ${taskName} لتبدأ في ${formattedStartTimeAr}.`;

      const notificationData = {
        type: "TASK",
        id: event.params.taskId,
      };

      await sendNotification({
        titleEn,
        bodyEn,
        titleAr,
        bodyAr,
        notificationData,
        branch,
      });

      console.log(`✅ Notification sent for new task "${taskName}"`);
    } catch (error) {
      console.error("❌ Error sending task created notification:", error);
    }
  },
);


/**
 * Scheduled function to mark late tasks.
 */
exports.markLateTasks = onSchedule(
  {
    schedule: "every 1 minutes",
    timeoutSeconds: 300,
    memory: "256MiB",
  },
  async () => {
    try {
      const now = Timestamp.now();
      const fiveMinutesAgo = Timestamp.fromMillis(now.toMillis() - 5 * 60 * 1000);

      const filter1 = Filter.and(
        Filter.where("status", "==", "NOT-STARTED"),
        Filter.where("startTime", "<=", fiveMinutesAgo),
        Filter.where("markedAsLate", "==", false),
      );

      const filter2 = Filter.and(
        Filter.where("status", "==", "IN-PROGRESS"),
        Filter.where("endTime", "<=", fiveMinutesAgo),
        Filter.where("markedAsLate", "==", false),
      );

      const combinedFilter = Filter.or(filter1, filter2);

      const snapshot = await db
        .collectionGroup("tasks")
        .where(combinedFilter)
        .get();

      if (snapshot.empty) {
        console.log("No tasks to mark as late at:", fiveMinutesAgo.toDate());
        return;
      }

      const batch = db.batch();
      const notifications = [];

      for (const doc of snapshot.docs) {
        const data = doc.data();
        batch.update(doc.ref, { markedAsLate: true });

        const id = doc.id;
        const branch = data.branch;
        const taskName = data.title;
        const deadlineTime = data.endTime;

        const deadlineTimeFormattedEn = new Intl.DateTimeFormat("en-US", {
          dateStyle: "medium",
          timeStyle: "short",
        }).format(deadlineTime.toDate());

        const deadlineTimeFormattedAr = new Intl.DateTimeFormat("ar-EG", {
          dateStyle: "medium",
          timeStyle: "short",
        }).format(deadlineTime.toDate());

        const titleEn = "⏰ Task Deadline Missed";
        const titleAr = "⏰ تأخير في تسليم المهمة";
        const bodyEn = `The task ${taskName} was not completed before the deadline at ${deadlineTimeFormattedEn}.`;
        const bodyAr = `المهمة ${taskName} لم تُنجز قبل الموعد النهائي في ${deadlineTimeFormattedAr}.`;

        const notificationData = {
          type: "TASK",
          id: id,
        };

        notifications.push(
          sendNotification({
            titleEn,
            bodyEn,
            titleAr,
            bodyAr,
            notificationData,
            branch,
          }),
        );
      }

      await batch.commit();
      await Promise.all(notifications);
      console.log(`✅ Marked ${snapshot.size} tasks as late and notifications sent.`);
    } catch (error) {
      console.error("❌ Error marking tasks as late:", error);
      throw error;
    }
  },
);

exports.onInventoryOperationCreated = onDocumentCreated({
  document: "inventoryOperations/{docId}",
}, async (event) => {
  try {
    const doc = event.data.data();
    if (!doc) return;

    const id = doc.id;
    const operationType = doc.operationType;

    const branch = doc.branch;
    const items = doc.items;
    const branchName = branch.name;
    const itemLabels = items.map((item) => `${item.quantity} ${item.name}`).join(", ");
    let titleEn = "";
    let titleAr = "";
    let bodyEn = "";
    let bodyAr = "";

    if (operationType == "DESTROY") {
         titleEn = "🗑️ Damaged Item";
         titleAr = "🗑️ صنف تالف";
         bodyEn = `${itemLabels} has been recorded as damaged in ${branchName}.`;
         bodyAr = `تم تسجيل ${itemLabels} كصنف تالف في ${branchName}.`;
    } else if (operationType == "ADD") {
        titleEn = "New Supply Received";
        titleAr = "📦 شحنة جديدة";
        bodyEn = `A new shipment of ${itemLabels} was received in ${branchName}.`;
        bodyAr = `تم استلام ${itemLabels} في ${branchName}.`;
      } else {
       return;
     }

    const notificationData = {
      type: "OPERATION",
      id: id,
     };
    await sendNotification({
      titleEn,
      bodyEn,
      titleAr,
      bodyAr,
      notificationData,
      branch,
    });

    console.log("✅ Notifications sent successfully for inventory ADD operation.");
  } catch (error) {
    console.error("❌ Error in onInventoryOperationCreated:", error);
  }
});

exports.onOrderHistoryCreate = onDocumentCreated({
  document: "orders/{orderId}/orderHistory/{historyId}",
}, async (event) => {
  try {
    const data = event.data.data();
    const status = data.status;
    const branch = data.branch;
    const id = data.id;
    const user = data.user;
    const operationType = data.operationType;
    const isSupply = operationType == "SUPPLY";
    const orderLabelEn = isSupply ? "supply order" : "transfer order";
    const orderLabelAr = isSupply ? "طلب تزويد" : "طلب نقل";

    let titleEn = "";
    let titleAr = "";
    let bodyEn = "";
    let bodyAr = "";

    if (status == "PLACED") {
      titleEn = `New ${orderLabelEn}`;
      titleAr = `${orderLabelAr} جديد`;
      bodyEn = `${orderLabelEn} has been placed by ${user.displayName}, please review and take the necessary action.`;
      bodyAr = `تم إرسال ${orderLabelAr} من قبل ${user.displayName}، يرجى المراجعة واتخاذ الإجراء المناسب.`;
    } else if (status == "APPROVED") {
      titleEn = `${orderLabelEn} Approved`;
      titleAr = `تمت الموافقة على ${orderLabelAr}`;
      bodyEn = `${orderLabelEn} has been approved by ${user.displayName}.`;
      bodyAr = `تمت الموافقة على ${orderLabelAr} من قبل ${user.displayName}.`;
    } else if (status == "IN-DELIVERY") {
      titleEn = `${orderLabelEn} In Delivery`;
      titleAr = `${orderLabelAr} قيد التوصيل`;
      bodyEn = `${orderLabelEn} is currently being delivered.`;
      bodyAr = `${orderLabelAr} قيد التوصيل حالياً.`;
    } else if (status == "REJECTED") {
      titleEn = `${orderLabelEn} Rejected`;
      titleAr = `تم رفض ${orderLabelAr}`;
      bodyEn = `${orderLabelEn} has been rejected by ${user.displayName}.`;
      bodyAr = `تم رفض ${orderLabelAr} من قبل ${user.displayName}.`;
    } else if (status == "COMPLETED") {
      titleEn = `${orderLabelEn} Completed`;
      titleAr = `اكتمل ${orderLabelAr}`;
      bodyEn = `${orderLabelEn} has been completed successfully.`;
      bodyAr = `تم الانتهاء من ${orderLabelAr} بنجاح.`;
    } else if (status == "CANCELED") {
      titleEn = `${orderLabelEn} Canceled`;
      titleAr = `تم إلغاء ${orderLabelAr}`;
      bodyEn = `${orderLabelEn} has been canceled by ${user.displayName}.`;
      bodyAr = `تم إلغاء ${orderLabelAr} من قبل ${user.displayName}.`;
    }

    const notificationData = {
      type: "ORDER",
      id: id,
     };
    await sendNotification({
      titleEn,
      bodyEn,
      titleAr,
      bodyAr,
      notificationData,
      branch,
    });
  } catch (error) {
    console.error("❌ Error in onInventoryOperationCreated:", error);
  }
});

async function sendNotification({
  titleEn,
  bodyEn,
  titleAr,
  bodyAr,
  role = "ADMIN",
  notificationData,
  branch,
}) {
  const usersSnapshot = await admin
    .firestore()
    .collection("users")
    .where("role", "==", role)
    .where("branch.id", "==", branch.id)
    .get();

  const notifications = [];

  for (const userDoc of usersSnapshot.docs) {
    const userRef = userDoc.ref;
    const user = userDoc.data();
    const token = user.deviceToken;
    const lang = user.languageCode || "ar";
    let title = "";
    let body = "";

    if (!token) continue;

    if (lang == "ar") {
        title = titleAr;
        body = bodyAr;
    } else {
       title = titleEn;
       body = bodyEn;
    }

    const payload = {
      token,
      notification: {
        title,
        body,
      },
      data: notificationData,
      apns: {
        payload: {
          aps: {
            sound: "default",
          },
        },
      },
    };

    notifications.push(admin.messaging().send(payload));

    // Update unread count
    userRef.update({
      unReadNotificationsCount: admin.firestore.FieldValue.increment(1),
    });

    // Add notification document
    const notificationRef = userRef.collection("notifications").doc();
    await notificationRef.set({
      id: notificationRef.id,
      notification: { title, body },
      data: notificationData,
      createdAt: admin.firestore.FieldValue.serverTimestamp(),
    });
  }

  await Promise.all(notifications);
}

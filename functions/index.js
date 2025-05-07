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

const NotificationType = {
  INVENTORY_ADD: "INVENTORY_ADD",
  // Add more types as needed
};

exports.onItemUpdate = onDocumentUpdated({
  region: "europe-west3",
  document: "items/{id}",
}, async (event) => {
  const oldData = event.data.before.data();
  const newData = event.data.after.data();
  const oldStatus = oldData.status;
  const quantity = newData.quantity;
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
      snapshot.forEach((doc) => {
        batch.update(doc.ref, { markedAsLate: true });
      });

      await batch.commit();
      console.log(`Marked ${snapshot.size} tasks as late.`);
    } catch (error) {
      console.error("Error marking tasks as late:", error);
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

    const operationType = doc.operationType;
    if (operationType !== "ADD") return;

    const branch = doc.branch;
    const items = doc.items;

    const branchName = branch.name;
    const itemLabels = items.map((item) => `${item.quantity} ${item.name}`).join(", ");

    const titleEn = "New Supply Received";
    const titleAr = "📦 شحنة جديدة";
    const bodyEn = `A new shipment of ${itemLabels} was received in ${branchName}.`;
    const bodyAr = `تم استلام ${itemLabels} في ${branchName}.`;

    await sendNotification({
      titleEn,
      bodyEn,
      titleAr,
      bodyAr,
      type: NotificationType.INVENTORY_ADD,
      branch,
    });

    console.log("✅ Notifications sent successfully for inventory ADD operation.");
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
  type,
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
      apns: {
        payload: {
          aps: {
            sound: "default",
          },
        },
      },
    };

    notifications.push(admin.messaging().send(payload));
  }

  await Promise.all(notifications);
}

/* eslint-disable max-len */
/* eslint-disable indent */
/* eslint-disable indent, object-curly-spacing */

const admin = require("firebase-admin");
const {onDocumentUpdated} = require("firebase-functions/v2/firestore");
const {onCall} = require("firebase-functions/v2/https");
const serviceAccount = require("./serviceAccountKey.json");
const {onSchedule} = require("firebase-functions/v2/scheduler");
const {Timestamp} = require("firebase-admin/firestore");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});

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
    await itemRef.update({status: newStatus});
  }

  return null;
});

/**
* Generates a custom token for a given user ID.
* @param {string} uid - The unique user ID for which to generate the token.
* @return {Promise<string>} - A promise that resolves to the custom token.
*/
exports.generateCustomToken = onCall({region: "europe-west3"},
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

exports.markLateTasks = onSchedule(
  {
    schedule: "every 1 minutes",
    timeoutSeconds: 300, // Default timeout, adjust as needed
    memory: "256MiB", // Default memory, adjust as needed
  },
  async (event) => {
    try {
      const now = Timestamp.now();
      const fiveMinutesAgo = Timestamp.fromMillis(now.toMillis() - 5 * 60 * 1000);

      const snapshot = await admin.firestore()
        .collectionGroup("tasks")
        .where("status", "==", "NOT-STARTED")
        .where("startTime", "<=", fiveMinutesAgo)
        .where("markedAsLate", "==", false)
        .get();

      const batch = admin.firestore().batch();
      snapshot.forEach((doc) => {
        batch.update(doc.ref, { markedAsLate: true });
      });

      if (!snapshot.empty) {
        await batch.commit();
        console.log(`Marked ${snapshot.size} tasks as late.`);
      } else {
        console.log("No tasks to mark as late.");
      }
    } catch (error) {
      console.error("Error marking tasks as late:", error);
      throw error; // Rethrow to ensure function failure is logged
    }
  },
);

/* eslint-disable max-len */
/* eslint-disable indent */
/* eslint-disable indent, object-curly-spacing */

const admin = require("firebase-admin");
const {onDocumentUpdated} = require("firebase-functions/v2/firestore");
const {onCall} = require("firebase-functions/v2/https");
const serviceAccount = require("./serviceAccountKey.json");

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

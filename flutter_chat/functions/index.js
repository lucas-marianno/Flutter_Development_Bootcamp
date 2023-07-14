/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const { onRequest } = require("firebase-functions/v2/https");
const logger = require("firebase-functions/logger");

// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

exports.helloWorld = onRequest((request, response) => {
    logger.info("Hello logs!", { structuredData: true });
    response.send("Hello from Firebase!");
});

const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

exports.sendPushNotification = functions.firestore

    .document('messages/{messageId}')
    .onCreate(async (snapshot) => {
        const messageData = snapshot.data();

        // Retrieve the relevant data from the new message
        const { sender, content } = messageData;

        // Get the device tokens of all users
        const usersSnapshot = await admin.firestore().collection('users').get();
        const deviceTokens = usersSnapshot.docs.map((user) => user.data().deviceToken);

        // Construct the notification payload
        const payload = {
            notification: {
                title: 'New Message',
                body: `New message from ${sender}: ${content}`,
            },
        };

        // Send the notification to all devices
        const response = await admin.messaging().sendToDevice(deviceTokens, payload);

        console.log('Notification sent:', response);
    });

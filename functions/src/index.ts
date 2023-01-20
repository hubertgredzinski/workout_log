import * as admin from "firebase-admin";
import * as functions from "firebase-functions";

// // Start writing functions
// // https://firebase.google.com/docs/functions/typescript



// export const helloWorld = functions.https.onRequest((request, response) => {
//     functions.logger.info("Hello logs!", { structuredData: true });
//     response.send("Hello from Firebase!");
// });

admin.initializeApp();

exports.createUserRecord = functions.auth.user().onCreate((user) => {
    console.log('user created', user.email, user.uid);
    return admin.firestore().collection('users').doc(user.uid).set({ email: user.email, create_at: admin.firestore.FieldValue.serverTimestamp() },);
});

exports.deleteUserRecord = functions.auth.user().onDelete((user) => {
    console.log('user deleted', user.email, user.uid);
    return admin.firestore().collection('users').doc(user.uid).delete();
});
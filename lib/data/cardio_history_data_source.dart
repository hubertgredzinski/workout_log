import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CardioDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getCardioDataSource() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('cardio')
        .snapshots();
  }

  Future<void> delete({required String documentID}) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('cardio')
        .doc(documentID)
        .delete();
  }

  Future<void> add(
    String type,
    String time,
    DateTime date,
    String? intensity,
    String? kcal,
  ) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('cardio')
        .add(
      {
        'type': type,
        'time': time,
        'date': date,
        'intensity': intensity,
        'kcal': kcal,
      },
    );
  }
}

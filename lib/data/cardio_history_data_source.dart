import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CardioHistoryDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getCardioDataSource() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('cardio')
        .orderBy('date', descending: true)
        .snapshots();
  }

  Future<void> delete({required String documentID}) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      Exception(
        'User is not logged in',
      );
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
    String? distance,
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
        'distance': distance,
      },
    );
  }
}

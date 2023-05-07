import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class StrengthHistoryDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getStrengthDataSource() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('strength')
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
        .collection('strength')
        .doc(documentID)
        .delete();
  }

  Future<void> add(String exercise, String bodyPart, String reps, String sets,
      String? weight, DateTime date) {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('strength')
        .add(
      {
        'exercise': exercise,
        'body_part': bodyPart,
        'reps': reps,
        'sets': sets,
        'weight': weight,
        'date': date,
      },
    );
  }
}

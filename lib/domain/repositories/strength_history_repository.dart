import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/strength_history_model.dart';

class StrengthRepository {
  Stream<List<StrengthHistoryModel>> getStrengthStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('strength')
        .snapshots()
        .map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (document) {
            return StrengthHistoryModel(
              id: document.id,
              bodypart: document['body_part'],
              date: (document['date'] as Timestamp).toDate(),
              exercise: document['exercise'],
              reps: document['reps'],
              sets: document['sets'],
              weight: document['weight'].toString(),
            );
          },
        ).toList();
      },
    );
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

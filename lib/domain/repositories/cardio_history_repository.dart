import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../models/cardio_history_model.dart';

@injectable
class CardioRepository {
  Stream<List<CardioHistoryModel>> getCardioStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('cardio')
        .snapshots()
        .map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (document) {
            return CardioHistoryModel(
              id: document.id,
              type: document['type'],
              time: document['time'],
              date: (document['date'] as Timestamp).toDate(),
              intensity: document['intensity'].toString(),
              kcal: document['kcal'].toString(),
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

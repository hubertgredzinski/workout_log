import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/cardio_history_model.dart';

class CardioRepository {
  Stream<List<CardioHistoryModel>> getCardioStream() {
    return FirebaseFirestore.instance.collection('cardio').snapshots().map(
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
    return FirebaseFirestore.instance
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
    return FirebaseFirestore.instance.collection('cardio').add(
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

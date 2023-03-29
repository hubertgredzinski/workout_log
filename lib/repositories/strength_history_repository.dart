import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/strength_history_model.dart';

class StrengthRepository {
  Stream<List<StrengthHistoryModel>> getStrengthStream() {
    return FirebaseFirestore.instance.collection('strength').snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (document) {
            return StrengthHistoryModel(
                bodypart: document['bodypart'],
                date: (document['date'] as Timestamp).toDate(),
                exercise: document['exercise'],
                reps: document['reps'],
                sets: document['sets'],
                weight: document['weight'].toString(),
                id: document.id);
          },
        ).toList();
      },
    );
  }

  Future<void> delete({required String documentID}) {
    return FirebaseFirestore.instance
        .collection('strength')
        .doc(documentID)
        .delete();
  }

  Future<void> add(String exercise, String bodyPart, String reps, String sets,
      String? weight, DateTime date) {
    return FirebaseFirestore.instance.collection('strength').add(
      {
        'exercise': exercise,
        'bodypart': bodyPart,
        'reps': reps,
        'sets': sets,
        'weight': weight,
        'date': date,
      },
    );
  }
}

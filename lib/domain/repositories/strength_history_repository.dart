import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workout_log/data/strength_history_data_source.dart';
import '../models/strength_history_model.dart';

class StrengthRepository {
  final StrengthHistoryDataSource strengthDataSource;

  StrengthRepository({required this.strengthDataSource});

  Stream<List<StrengthHistoryModel>> getStrengthStream() {
    return strengthDataSource.getStrengthDataSource().map(
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
    return strengthDataSource.delete(documentID: documentID);
  }

  Future<void> add(String exercise, String bodyPart, String reps, String sets,
      String? weight, DateTime date) {
    return strengthDataSource.add(exercise, bodyPart, reps, sets, weight, date);
  }
}

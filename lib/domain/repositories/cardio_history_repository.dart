import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../data/cardio_history_data_source.dart';
import '../models/cardio_history_model.dart';

class CardioRepository {
  final CardioHistoryDataSource cardioDataSource;

  CardioRepository({required this.cardioDataSource});

  Stream<List<CardioHistoryModel>> getCardioStream() {
    return cardioDataSource.getCardioDataSource().map(
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
              distance: document['distance'].toString(),
            );
          },
        ).toList();
      },
    );
  }

  Future<void> delete({
    required String documentID,
  }) {
    return cardioDataSource.delete(
      documentID: documentID,
    );
  }

  Future<void> add(
    String? type,
    String? time,
    DateTime? date,
    String? intensity,
    String? kcal,
    String? distance,
  ) {
    return cardioDataSource.add(
      type!,
      time!,
      date!,
      intensity!,
      kcal!,
      distance!,
    );
  }
}

import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../../models/strength_history_model.dart';

part 'strength_history_state.dart';

class StrengthHistoryCubit extends Cubit<StrengthHistoryState> {
  StrengthHistoryCubit()
      : super(
          const StrengthHistoryState(),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription =
        FirebaseFirestore.instance.collection('strength').snapshots().listen(
      (strengthData) {
        final strengthModels = strengthData.docs.map(
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
        emit(
          StrengthHistoryState(strengthDocuments: strengthModels),
        );
      },
    )..onError(
            (error) {
              emit(
                const StrengthHistoryState(loadingErrorOccured: true),
              );
            },
          );
  }

  Future<void> remove({required String documentID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('strength')
          .doc(documentID)
          .delete();
    } catch (error) {
      emit(
        const StrengthHistoryState(removingErrorOccured: true),
      );
      start();
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}

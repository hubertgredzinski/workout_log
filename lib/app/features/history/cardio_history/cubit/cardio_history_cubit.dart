import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../../../models/cardio_history_model.dart';
part 'cardio_history_state.dart';

class CardioHistoryCubit extends Cubit<CardioHistoryState> {
  CardioHistoryCubit()
      : super(
          CardioHistoryState(documents: [], isLoading: false, errorMessage: ''),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      CardioHistoryState(documents: [], isLoading: true, errorMessage: ''),
    );
    _streamSubscription =
        FirebaseFirestore.instance.collection('cardio').snapshots().listen(
      (cardioData) {
        final cardioModels = cardioData.docs.map(
          (document) {
            return CardioHistoryModel(
              id: document.id,
              type: document['type'],
              time: document['time'],
              date: (document['date'] as Timestamp).toDate(),
              intensity: document['intensity'],
              kcal: document['kcal'],
            );
          },
        ).toList();
        emit(
          CardioHistoryState(
              documents: cardioModels, isLoading: false, errorMessage: ''),
        );
      },
    )..onError(
            (error) {
              emit(
                CardioHistoryState(
                  documents: [],
                  isLoading: false,
                  errorMessage: error.toString(),
                ),
              );
            },
          );
  }

  Future<void> remove({required String documentID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('cardio')
          .doc(documentID)
          .delete();
    } catch (error) {
      emit(
        CardioHistoryState(
          documents: [],
          isLoading: false,
          errorMessage: error.toString(),
        ),
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

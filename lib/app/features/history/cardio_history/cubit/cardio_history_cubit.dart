import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
part 'cardio_history_state.dart';

class CardioHistoryCubit extends Cubit<CardioHistoryState> {
  CardioHistoryCubit()
      : super(
          const CardioHistoryState(
              documents: [], isLoading: false, errorMessage: ''),
        );

  StreamSubscription? _streamSubscription;

  Future<void> startCardioHistory() async {
    emit(
      const CardioHistoryState(
          documents: [], isLoading: true, errorMessage: ''),
    );
    _streamSubscription =
        FirebaseFirestore.instance.collection('cardio').snapshots().listen(
      (data) {
        emit(
          CardioHistoryState(
              documents: data.docs, isLoading: false, errorMessage: ''),
        );
      },
    )..onError(
            (error) {
              emit(
                CardioHistoryState(
                  documents: const [],
                  isLoading: false,
                  errorMessage: error.toString(),
                ),
              );
            },
          );
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}

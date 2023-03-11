import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
part 'cardio_history_state.dart';

class CardioHistoryCubit extends Cubit<CardioHistoryState> {
  CardioHistoryCubit()
      : super(
          const CardioHistoryState(
              documents: null, isLoading: false, errorMessage: ''),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const CardioHistoryState(
          documents: null, isLoading: true, errorMessage: ''),
    );
    _streamSubscription =
        FirebaseFirestore.instance.collection('cardio').snapshots().listen(
      (data) {
        emit(
          CardioHistoryState(
              documents: data, isLoading: false, errorMessage: ''),
        );
      },
    )..onError(
            (error) {
              emit(
                CardioHistoryState(
                  documents: null,
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
          documents: null,
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

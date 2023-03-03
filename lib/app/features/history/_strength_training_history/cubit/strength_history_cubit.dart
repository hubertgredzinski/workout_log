import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
part 'strength_history_state.dart';

class StrengthHistoryCubit extends Cubit<StrengthHistoryState> {
  StrengthHistoryCubit()
      : super(
          const StrengthHistoryState(
              documents: [], isLoading: false, errorMessage: ''),
        );

  StreamSubscription? _streamSubscription;

  Future<void> startStrengthHistory() async {
    emit(
      const StrengthHistoryState(
          documents: [], isLoading: true, errorMessage: ''),
    );
    _streamSubscription =
        FirebaseFirestore.instance.collection('strength').snapshots().listen(
      (data) {
        emit(
          StrengthHistoryState(
              documents: data.docs, isLoading: false, errorMessage: ''),
        );
      },
    )..onError(
            (error) {
              emit(
                StrengthHistoryState(
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

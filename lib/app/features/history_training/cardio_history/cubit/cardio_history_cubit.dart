import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:workout_log/repositories/cardio_history_repository.dart';

import '../../../../../models/cardio_history_model.dart';
part 'cardio_history_state.dart';

class CardioHistoryCubit extends Cubit<CardioHistoryState> {
  CardioHistoryCubit(this._cardioRepository)
      : super(
          CardioHistoryState(),
        );

  final CardioRepository _cardioRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = _cardioRepository.getCardioStream().listen(
      (cardioData) {
        emit(
          CardioHistoryState(cardioDocuments: cardioData),
        );
      },
    )..onError(
        (error) {
          emit(
            CardioHistoryState(
              loadingErrorOccured: true,
            ),
          );
        },
      );
  }

  Future<void> remove({required String documentID}) async {
    try {
      await _cardioRepository.delete(documentID: documentID);
    } catch (error) {
      emit(
        CardioHistoryState(
          removingErrorOccured: true,
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

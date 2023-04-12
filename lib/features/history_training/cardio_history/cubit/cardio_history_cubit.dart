import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:workout_log/domain/repositories/cardio_history_repository.dart';
import '../../../../../domain/models/cardio_history_model.dart';
import '../../../../app/core/enums/enums.dart';
part 'cardio_history_state.dart';

class CardioHistoryCubit extends Cubit<CardioHistoryState> {
  CardioHistoryCubit(this._cardioRepository)
      : super(
          CardioHistoryState(),
        );

  final CardioRepository _cardioRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(CardioHistoryState(status: Status.loading));
    _streamSubscription = _cardioRepository.getCardioStream().listen(
      (cardioData) {
        emit(
          CardioHistoryState(
              cardioDocuments: cardioData, status: Status.success),
        );
      },
    )..onError(
        (error) {
          emit(
            CardioHistoryState(
              status: Status.error,
              errorMessage: error.toString(),
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
          status: Status.error,
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

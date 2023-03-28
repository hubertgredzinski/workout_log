import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:workout_log/repositories/strength_history_repository.dart';

import '../../../../../models/strength_history_model.dart';
part 'strength_history_state.dart';

class StrengthHistoryCubit extends Cubit<StrengthHistoryState> {
  StrengthHistoryCubit(this._strengthRepository)
      : super(
          const StrengthHistoryState(),
        );

  StreamSubscription? _streamSubscription;

  final StrengthRepository _strengthRepository;

  Future<void> start() async {
    _streamSubscription = _strengthRepository.getStrengthStream().listen(
      (strengthData) {
        emit(
          StrengthHistoryState(strengthDocuments: strengthData),
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
      await _strengthRepository.delete(documentID: documentID);
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

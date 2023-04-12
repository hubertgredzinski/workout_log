import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:workout_log/repositories/strength_history_repository.dart';

import '../../../../../models/strength_history_model.dart';
import '../../../../core/enums/enums.dart';

part 'strength_history_state.dart';

class StrengthHistoryCubit extends Cubit<StrengthHistoryState> {
  StrengthHistoryCubit(this._strengthRepository)
      : super(
          const StrengthHistoryState(),
        );

  final StrengthRepository _strengthRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(const StrengthHistoryState(status: Status.loading));
    _streamSubscription = _strengthRepository.getStrengthStream().listen(
      (strengthData) {
        emit(
          StrengthHistoryState(
              strengthDocuments: strengthData, status: Status.success),
        );
      },
    )..onError(
        (error) {
          emit(
            StrengthHistoryState(
              status: Status.error,
              errorMessage: error.toString(),
            ),
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
        StrengthHistoryState(
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

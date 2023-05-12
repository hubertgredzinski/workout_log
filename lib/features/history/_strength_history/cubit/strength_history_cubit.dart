import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:workout_log/domain/repositories/strength_history_repository.dart';
import '../../../../../domain/models/strength_history_model.dart';
import '../../../../app/core/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'strength_history_state.dart';
part 'strength_history_cubit.freezed.dart';

class StrengthHistoryCubit extends Cubit<StrengthHistoryState> {
  StrengthHistoryCubit({
    required this.strengthRepository,
  }) : super(
          StrengthHistoryState(),
        );

  final StrengthRepository strengthRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      StrengthHistoryState(
        status: Status.loading,
      ),
    );
    _streamSubscription = strengthRepository.getStrengthStream().listen(
      (strengthData) {
        emit(
          StrengthHistoryState(
            strengthDocuments: strengthData,
            status: Status.success,
          ),
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
      await strengthRepository.delete(
        documentID: documentID,
      );
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

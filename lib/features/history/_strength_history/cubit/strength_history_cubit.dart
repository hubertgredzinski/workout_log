import 'dart:async';
import 'package:bloc/bloc.dart';
import '../../../../../domain/models/strength_history_model.dart';
import '../../../../app/core/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/repositories/strength_history_repository.dart';
part 'strength_history_state.dart';
part 'strength_history_cubit.freezed.dart';

class StrengthHistoryCubit extends Cubit<StrengthHistoryState> {
  StrengthHistoryCubit({
    required this.strengthHistoryRepository,
  }) : super(
          StrengthHistoryState(),
        );

  final StrengthHistoryRepository strengthHistoryRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      StrengthHistoryState(
        status: Status.loading,
      ),
    );
    _streamSubscription = strengthHistoryRepository.getStrengthStream().listen(
      (strengthData) {
        emit(
          StrengthHistoryState(
            status: Status.success,
            strengthDocuments: strengthData,
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
      await strengthHistoryRepository.delete(
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

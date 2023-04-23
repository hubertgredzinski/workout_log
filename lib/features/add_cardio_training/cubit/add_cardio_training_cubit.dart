import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:workout_log/domain/repositories/cardio_history_repository.dart';
import '../../../app/core/enums/enums.dart';
part 'add_cardio_training_cubit.freezed.dart';
part 'add_cardio_training_state.dart';

@injectable
class AddCardioTrainingCubit extends Cubit<AddCardioTrainingState> {
  AddCardioTrainingCubit(this._cardioRepository)
      : super(
          AddCardioTrainingState(),
        );

  final CardioRepository _cardioRepository;
  Future<void> add(
    String type,
    String time,
    DateTime date,
    String? intensity,
    String? kcal,
  ) async {
    try {
      await _cardioRepository.add(type, time, date, intensity, kcal);
      emit(
        AddCardioTrainingState(
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        AddCardioTrainingState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}

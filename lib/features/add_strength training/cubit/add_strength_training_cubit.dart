import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workout_log/domain/repositories/strength_history_repository.dart';
import '../../../app/core/enums/enums.dart';
part 'add_strength_training_cubit.freezed.dart';
part 'add_strength_training_state.dart';

class AddStrengthTrainingCubit extends Cubit<AddStrengthTrainingState> {
  AddStrengthTrainingCubit(this._strengthRepository)
      : super(
          AddStrengthTrainingState(),
        );

  final StrengthRepository _strengthRepository;
  Future<void> add(String exercise, String bodyPart, String reps, String sets,
      String? weight, DateTime date) async {
    try {
      await _strengthRepository.add(
          exercise, bodyPart, reps, sets, weight, date);
      emit(
        AddStrengthTrainingState(
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        AddStrengthTrainingState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}

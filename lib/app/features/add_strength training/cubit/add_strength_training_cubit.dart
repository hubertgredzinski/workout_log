import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:workout_log/repositories/strength_history_repository.dart';
part 'add_strength_training_state.dart';

class AddStrengthTrainingCubit extends Cubit<AddStrengthTrainingState> {
  AddStrengthTrainingCubit(this._strengthRepository)
      : super(
          const AddStrengthTrainingState(),
        );

  final StrengthRepository _strengthRepository;
  Future<void> add(String exercise, String bodyPart, String reps, String sets,
      String? weight, DateTime date) async {
    try {
      await _strengthRepository.add(
          exercise, bodyPart, reps, sets, weight, date);
      emit(
        const AddStrengthTrainingState(saved: true),
      );
    } catch (error) {
      emit(
        AddStrengthTrainingState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}

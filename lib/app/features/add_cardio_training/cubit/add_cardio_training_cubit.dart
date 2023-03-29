import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:workout_log/repositories/cardio_history_repository.dart';
part 'add_cardio_training_state.dart';

class AddCardioTrainingCubit extends Cubit<AddCardioTrainingState> {
  AddCardioTrainingCubit(this._cardioRepository)
      : super(
          const AddCardioTrainingState(),
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
        const AddCardioTrainingState(saved: true),
      );
    } catch (error) {
      emit(
        AddCardioTrainingState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}

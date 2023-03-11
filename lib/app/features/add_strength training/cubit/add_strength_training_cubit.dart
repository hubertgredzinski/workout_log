import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'add_strength_training_state.dart';

class AddStrengthTrainingCubit extends Cubit<AddStrengthTrainingState> {
  AddStrengthTrainingCubit()
      : super(
          const AddStrengthTrainingState(),
        );
  Future<void> add(String exercise, String bodyPart, String reps, String sets,
      String? weight) async {
    try {
      await FirebaseFirestore.instance.collection('strength').add(
        {
          'exercise': exercise,
          'bodypart': bodyPart,
          'reps': reps,
          'sets': sets,
          'weight': weight,
        },
      );
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

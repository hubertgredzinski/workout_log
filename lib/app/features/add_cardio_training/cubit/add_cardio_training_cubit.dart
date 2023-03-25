import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
part 'add_cardio_training_state.dart';

class AddCardioTrainingCubit extends Cubit<AddCardioTrainingState> {
  AddCardioTrainingCubit()
      : super(
          const AddCardioTrainingState(),
        );
  Future<void> add(
    String type,
    String time,
    DateTime date,
    String? intensity,
    String? kcal,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('cardio').add(
        {
          'type': type,
          'time': time,
          'date': date,
          'intensity': intensity,
          'kcal': kcal,
        },
      );
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

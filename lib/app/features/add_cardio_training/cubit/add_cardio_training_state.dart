part of 'add_cardio_training_cubit.dart';

@immutable
class AddCardioTrainingState {
  const AddCardioTrainingState({
    this.saved = false,
    this.errorMessage = '',
  });

  final bool saved;
  final String errorMessage;
}

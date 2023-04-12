part of 'add_cardio_training_cubit.dart';

@immutable
class AddCardioTrainingState {
  const AddCardioTrainingState({
    this.status = Status.initial,
    this.errorMessage = '',
  });

  final Status status;
  final String? errorMessage;
}

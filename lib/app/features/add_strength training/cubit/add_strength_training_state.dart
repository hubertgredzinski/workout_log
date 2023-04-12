part of 'add_strength_training_cubit.dart';

@immutable
class AddStrengthTrainingState {
  const AddStrengthTrainingState({
    this.status = Status.initial,
    this.errorMessage = '',
  });

  final Status status;
  final String? errorMessage;
}

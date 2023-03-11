part of 'add_strength_training_cubit.dart';

@immutable
class AddStrengthTrainingState {
  const AddStrengthTrainingState({
    this.saved = false,
    this.errorMessage = '',
  });

  final bool saved;
  final String errorMessage;
}

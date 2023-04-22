part of 'add_strength_training_cubit.dart';

@freezed
class AddStrengthTrainingState with _$AddStrengthTrainingState {
  factory AddStrengthTrainingState({
    @Default(Status.initial) Status status,
    String? errorMessage,
  }) = _AddStrengthTrainingState;
}

part of 'add_cardio_training_cubit.dart';

@freezed
class AddCardioTrainingState with _$AddCardioTrainingState {
  factory AddCardioTrainingState({
    @Default(Status.initial) Status status,
    String? errorMessage,
  }) = _AddStrengthTrainingState;
}

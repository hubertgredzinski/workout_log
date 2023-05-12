part of 'strength_history_cubit.dart';

@freezed
class StrengthHistoryState with _$StrengthHistoryState {
  factory StrengthHistoryState({
    @Default([]) List<StrengthHistoryModel> strengthDocuments,
    @Default(Status.initial) Status status,
    String? errorMessage,
  }) = _StrengthHistoryState;
}

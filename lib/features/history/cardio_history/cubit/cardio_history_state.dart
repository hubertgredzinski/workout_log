part of 'cardio_history_cubit.dart';

@freezed
class CardioHistoryState with _$CardioHistoryState {
  factory CardioHistoryState({
    @Default([]) List<CardioHistoryModel> cardioDocuments,
    @Default(Status.initial) status,
    String? errorMessage,
  }) = _CardioHistoryState;
}

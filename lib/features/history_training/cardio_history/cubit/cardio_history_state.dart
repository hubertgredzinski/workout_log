part of 'cardio_history_cubit.dart';

@freezed
class CardioHistoryState with _$CardioHistoryState {
  factory CardioHistoryState({
    @Default([]) List<CardioHistoryModel> cardioDocuments,
    @Default(Status.initial) status,
    String? errorMessage,
  }) = _CardioHistoryState;
}

// class CardioHistoryState {
//   final List<CardioHistoryModel> cardioDocuments;
//   final Status status;
//   final String? errorMessage;

//   CardioHistoryState({
//     this.cardioDocuments = const [],
//     this.status = Status.initial,
//     this.errorMessage = '',
//   });
// }

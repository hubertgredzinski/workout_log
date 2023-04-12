part of 'cardio_history_cubit.dart';

class CardioHistoryState {
  final List<CardioHistoryModel> cardioDocuments;
  final Status status;
  final String? errorMessage;

  CardioHistoryState({
    this.cardioDocuments = const [],
    this.status = Status.initial,
    this.errorMessage = '',
  });
}

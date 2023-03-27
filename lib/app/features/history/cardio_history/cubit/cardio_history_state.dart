part of 'cardio_history_cubit.dart';

class CardioHistoryState {
  final List<CardioHistoryModel> cardioDocuments;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;

  CardioHistoryState({
    this.cardioDocuments = const [],
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
  });
}

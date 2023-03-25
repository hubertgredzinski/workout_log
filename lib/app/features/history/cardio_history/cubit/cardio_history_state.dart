part of 'cardio_history_cubit.dart';

class CardioHistoryState {
  final List<CardioHistoryModel> documents;
  final bool isLoading;
  final String errorMessage;

  CardioHistoryState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}

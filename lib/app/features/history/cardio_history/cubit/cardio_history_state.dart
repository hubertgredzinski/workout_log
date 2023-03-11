part of 'cardio_history_cubit.dart';

class CardioHistoryState {
  final QuerySnapshot<Map<String, dynamic>>? documents;
  final bool isLoading;
  final String errorMessage;

  const CardioHistoryState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}

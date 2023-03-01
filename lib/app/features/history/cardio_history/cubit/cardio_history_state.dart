part of 'cardio_history_cubit.dart';

@immutable
class CardioHistoryState {
  final List<QueryDocumentSnapshot<Object?>> documents;
  final bool isLoading;
  final String errorMessage;

  const CardioHistoryState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}

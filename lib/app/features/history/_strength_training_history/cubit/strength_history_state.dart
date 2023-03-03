part of 'strength_history_cubit.dart';

@immutable
class StrengthHistoryState {
  final List<QueryDocumentSnapshot<Object?>> documents;
  final bool isLoading;
  final String errorMessage;

  const StrengthHistoryState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}

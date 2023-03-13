part of 'strength_history_cubit.dart';

@immutable
class StrengthHistoryState {
  final QuerySnapshot<Map<String, dynamic>>? documents;
  final bool isLoading;
  final String errorMessage;

  const StrengthHistoryState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}

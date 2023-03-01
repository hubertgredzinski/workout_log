part of 'history_strength_cubit.dart';

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

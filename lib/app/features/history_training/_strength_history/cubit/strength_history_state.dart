part of 'strength_history_cubit.dart';

@immutable
class StrengthHistoryState {
  final List<StrengthHistoryModel> strengthDocuments;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;

  const StrengthHistoryState({
    this.strengthDocuments = const [],
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
  });
}

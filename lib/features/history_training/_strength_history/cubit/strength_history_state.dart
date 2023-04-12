part of 'strength_history_cubit.dart';

@immutable
class StrengthHistoryState {
  final List<StrengthHistoryModel> strengthDocuments;
  final Status status;
  final String? errorMessage;

  const StrengthHistoryState({
    this.strengthDocuments = const [],
    this.status = Status.initial,
    this.errorMessage = '',
  });
}

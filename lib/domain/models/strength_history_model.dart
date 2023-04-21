import 'package:intl/intl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'strength_history_model.freezed.dart';

@freezed
class StrengthHistoryModel with _$StrengthHistoryModel {
  const StrengthHistoryModel._();
  factory StrengthHistoryModel({
    required String bodypart,
    required DateTime date,
    required String exercise,
    required String reps,
    required String sets,
    required String weight,
    required String id,
  }) = _StrengthHistoryModel;

  String dateFromatted() {
    return DateFormat.yMMMMEEEEd().format(date);
  }
}

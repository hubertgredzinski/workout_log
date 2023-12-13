import 'package:intl/intl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'cardio_history_model.freezed.dart';

@freezed
class CardioHistoryModel with _$CardioHistoryModel {
  const CardioHistoryModel._();
  factory CardioHistoryModel({
    required String id,
    required String type,
    required String time,
    required DateTime date,
    required String? intensity,
    required String? kcal,
    required String? distance,
  }) = _CardioHistoryModel;
  String dateFromatted() {
    return DateFormat.yMMMMEEEEd().format(date);
  }
}

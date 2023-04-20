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
    required String intensity,
    required String kcal,
  }) = _CardioHistoryModel;
  String dateFromatted() {
    return DateFormat.yMMMMEEEEd().format(date);
  }
}

// class CardioHistoryModel {
//   CardioHistoryModel({
//     required this.id,
//     required this.type,
//     required this.time,
//     required this.date,
//     required this.intensity,
//     required this.kcal,
//   });
//   final String id;
//   final String type;
//   final String time;
//   final DateTime date;
//   final String intensity;
//   final String kcal;


// }

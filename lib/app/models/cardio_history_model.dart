class CardioHistoryModel {
  CardioHistoryModel({
    required this.id,
    required this.type,
    required this.time,
    required this.date,
    required this.intensity,
    required this.kcal,
  });
  final String id;
  final String type;
  final String time;
  final DateTime date;
  final String intensity;
  final String kcal;
}

class StrengthHistoryModel {
  StrengthHistoryModel(
      {required this.id,
      required this.bodypart,
      required this.date,
      required this.exercise,
      required this.reps,
      required this.sets,
      required this.weight});

  final String bodypart;
  final DateTime date;
  final String exercise;
  final String reps;
  final String sets;
  final String weight;
  final String id;
}

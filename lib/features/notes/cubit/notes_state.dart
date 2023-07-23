part of 'notes_cubit.dart';

class NotesState {
  final List<QueryDocumentSnapshot<Object?>> documents;
  final Status status;
  final String? errorMessage;

  NotesState({
    this.status = Status.initial,
    this.errorMessage,
    required this.documents,
  });
}

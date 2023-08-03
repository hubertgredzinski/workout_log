part of 'notes_cubit.dart';

class NotesState {
  final List<NotesModel>? notes;
  final Status status;
  final String? errorMessage;

  NotesState({
    this.status = Status.initial,
    this.errorMessage,
    this.notes,
  });
}

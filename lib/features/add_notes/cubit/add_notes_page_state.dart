part of 'add_notes_page_cubit.dart';

@immutable
class AddNotesPageState {
  final Status status;
  final String? errorMessage;

  const AddNotesPageState({
    this.status = Status.initial,
    this.errorMessage,
  });
}

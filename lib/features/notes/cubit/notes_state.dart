part of 'notes_cubit.dart';

@freezed
class NotesState with _$NotesState {
  factory NotesState({
    @Default([]) List<NotesModel> notes,
    @Default(Status.initial) Status status,
    String? errorMessage,
  }) = _NotesState;
}

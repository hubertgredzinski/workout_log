import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:workout_log/domain/repositories/notes_repository.dart';
import '../../../app/core/enums/enums.dart';
import '../../../domain/models/notes_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit(this._notesRepository)
      : super(
          NotesState(
            notes: [],
          ),
        );

  final NotesRepository _notesRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      NotesState(
        status: Status.loading,
        notes: [],
      ),
    );
    _streamSubscription = _notesRepository.getNotesStream().listen(
      (notes) {
        emit(
          NotesState(
            notes: notes,
            status: Status.success,
          ),
        );
      },
    )..onError(
        (error) {
          emit(
            NotesState(
              notes: [],
              status: Status.error,
              errorMessage: error.toString(),
            ),
          );
        },
      );
  }

  Future<void> remove({required String documentID}) async {
    try {
      await _notesRepository.delete(
        id: documentID,
      );
    } catch (error) {
      emit(
        NotesState(
          notes: [],
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
      start();
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}

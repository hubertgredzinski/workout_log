import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../app/core/enums/enums.dart';
import '../../../domain/models/repositories/notes_repository.dart';
part 'add_notes_page_state.dart';

class AddNotesPageCubit extends Cubit<AddNotesPageState> {
  AddNotesPageCubit(this._notesRepository) : super(const AddNotesPageState());

  final NotesRepository _notesRepository;

  Future<void> add(
    String title,
  ) async {
    try {
      await _notesRepository.add(
        title,
      );
      emit(
        const AddNotesPageState(
          status: Status.success,
        ),
      );
    } catch (error) {
      emit(
        AddNotesPageState(
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}

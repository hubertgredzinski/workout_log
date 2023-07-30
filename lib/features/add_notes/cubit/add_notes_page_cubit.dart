import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../app/core/enums/enums.dart';
part 'add_notes_page_state.dart';

class AddNotesPageCubit extends Cubit<AddNotesPageState> {
  AddNotesPageCubit() : super(const AddNotesPageState());

  Future<void> add(
    String title,
  ) async {
    try {
      FirebaseFirestore.instance.collection('notes').add(
        {
          'title': title,
        },
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

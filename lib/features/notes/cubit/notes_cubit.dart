import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../app/core/enums/enums.dart';
import '../../../domain/models/notes_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit()
      : super(
          NotesState(
            notes: [],
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      NotesState(
        status: Status.loading,
        notes: [],
      ),
    );
    _streamSubscription =
        FirebaseFirestore.instance.collection('notes').snapshots().listen(
      (notes) {
        final noteModels = notes.docs.map((note) {
          return NotesModel(
            id: note.id,
            title: note['title'],
          );
        }).toList();
        emit(
          NotesState(
            notes: noteModels,
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
      FirebaseFirestore.instance.collection('notes').doc(documentID).delete();
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

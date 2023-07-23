import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../app/core/enums/enums.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit()
      : super(
          NotesState(
            documents: [],
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      NotesState(
        status: Status.loading,
        documents: [],
      ),
    );
    _streamSubscription =
        FirebaseFirestore.instance.collection('notes').snapshots().listen(
      (note) {
        emit(
          NotesState(
            documents: note.docs,
            status: Status.success,
          ),
        );
      },
    )..onError(
            (error) {
              emit(
                NotesState(
                  documents: [],
                  status: Status.error,
                  errorMessage: error.toString(),
                ),
              );
            },
          );
  }

  Future<void> add(
    String title,
  ) {
    return FirebaseFirestore.instance.collection('notes').add(
      {
        'title': title,
      },
    );
  }

  Future<void> remove({required String documentID}) async {
    try {
      FirebaseFirestore.instance.collection('notes').doc(documentID).delete();
    } catch (error) {
      emit(
        NotesState(
          documents: [],
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

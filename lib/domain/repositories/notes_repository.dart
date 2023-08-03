import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:workout_log/domain/models/notes_model.dart';

class NotesRepository {
  Stream<List<NotesModel>> getNotesStream() {
    return FirebaseFirestore.instance.collection('notes').snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return NotesModel(
              id: doc.id,
              title: doc['title'],
            );
          },
        ).toList();
      },
    );
  }

  Future<void> delete({
    required String id,
  }) {
    return FirebaseFirestore.instance.collection('notes').doc(id).delete();
  }

  Future<void> add(
    String title,
  ) async {
    await FirebaseFirestore.instance.collection('notes').add(
      {
        'title': title,
      },
    );
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';
part 'notes_model.freezed.dart';

@freezed
class NotesModel with _$NotesModel {
  const NotesModel._();
  factory NotesModel({
    required String title,
    required String id,
  }) = _NotesModel;
}

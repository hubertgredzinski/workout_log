import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_log/domain/repositories/notes_repository.dart';
import 'package:workout_log/features/add_notes/add_notes_page.dart';
import 'package:workout_log/features/notes/cubit/notes_cubit.dart';
import '../../app/core/enums/enums.dart';
import '../../domain/models/notes_model.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(
            100,
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNotesPage(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: BlocProvider(
        create: (context) => NotesCubit(
          NotesRepository(),
        )..start(),
        child: BlocListener<NotesCubit, NotesState>(
          listener: (context, state) {
            if (state.status == Status.error) {
              final errorMessage = state.errorMessage ?? 'Unkown error';
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    errorMessage,
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: BlocBuilder<NotesCubit, NotesState>(
            builder: (context, state) {
              final notesModels = state.notes;
              return ListView(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  for (final noteModel in notesModels!) ...[
                    Dismissible(
                      key: ValueKey(
                        noteModel.id,
                      ),
                      background: const DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.red,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                              right: 32.0,
                            ),
                            child: Icon(
                              Icons.delete,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      onDismissed: (_) {
                        context.read<NotesCubit>().remove(
                              documentID: noteModel.id,
                            );
                      },
                      child: Note(
                        noteModel: noteModel,
                      ),
                    ),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class Note extends StatelessWidget {
  const Note({
    required this.noteModel,
    super.key,
  });
  final NotesModel noteModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        20,
      ),
      margin: const EdgeInsets.only(
        bottom: 15,
        top: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        color: Colors.blue,
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Text(
        noteModel.title,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
      ),
    );
  }
}

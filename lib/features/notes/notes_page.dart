import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_log/features/add_notes/add_notes_page.dart';
import 'package:workout_log/features/notes/cubit/notes_cubit.dart';
import '../../app/core/enums/enums.dart';
import '../../app/core/injection_container.dart';
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
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/notes.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black87,
          foregroundColor: Colors.white70,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 2,
              color: Colors.grey,
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
        body: BlocProvider<NotesCubit>(
          create: (context) => getIt()..start(),
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
                    for (final noteModel in notesModels) ...[
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
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        color: Colors.black,
        border: Border.all(
          color: Colors.grey,
          width: 2,
        ),
      ),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          noteModel.title,
          style: const TextStyle(
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

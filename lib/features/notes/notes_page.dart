import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_log/features/notes/cubit/notes_cubit.dart';
import '../../app/core/config.dart';
import '../../app/core/enums/enums.dart';

class NotesPage extends StatelessWidget {
  NotesPage({super.key});

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
          FirebaseFirestore.instance.collection('notes').add(
            {'title': controller.text},
          );
          controller.clear();
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: BlocProvider(
        create: (context) => NotesCubit()..start(),
        child: BlocBuilder<NotesCubit, NotesState>(
          builder: (context, state) {
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
            if (state.status == Status.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final documents = state.documents;
            return ListView(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    Config.version,
                    textAlign: TextAlign.right,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    labelText: 'Notes',
                    suffixIcon: Icon(
                      Icons.notes_outlined,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                for (final document in documents) ...[
                  Dismissible(
                    key: ValueKey(
                      document.id,
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
                          ),
                        ),
                      ),
                    ),
                    onDismissed: (_) {
                      context.read<NotesCubit>().remove(
                            documentID: document.id,
                          );
                    },
                    child: Note(
                      document['title'],
                    ),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}

class Note extends StatelessWidget {
  const Note(
    this.title, {
    super.key,
  });
  final String title;
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
        title,
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
      ),
    );
  }
}

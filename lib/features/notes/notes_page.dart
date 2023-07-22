import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../app/core/config.dart';

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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('notes').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Wystąpił nieoczekiwany problem');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            const Text('Proszę czeka trwa ładowanie danych');
          }

          final documents = snapshot.data!.docs;
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
                  onDismissed: (_) {
                    FirebaseFirestore.instance
                        .collection('notes')
                        .doc(document.id)
                        .delete();
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

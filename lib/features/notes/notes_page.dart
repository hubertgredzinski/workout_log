import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../app/core/config.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          FirebaseFirestore.instance.collection('notes').add(
            {'title': 'Super kategoria'},
          );
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
      color: Colors.blue,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      child: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}

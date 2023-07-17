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
        onPressed: () {},
        child: const Icon(
          Icons.add,
        ),
      ),
      body: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance.collection('notes').snapshots(),
          builder: (context, snapshot) {
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
                const Note('Kategoria 1'),
                const Note('Kategoria 2'),
                const Note('Kategoria 3'),
              ],
            );
          }),
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

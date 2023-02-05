import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HistoryCardioTrainingPage extends StatelessWidget {
  const HistoryCardioTrainingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardio Training History'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('cardio').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            const Text('Wystąpił błąd w aplikacji');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            const Text('Proszę czekać, trwa ładowanie danych');
          }

          final documents = snapshot.data!.docs;

          return ListView(
            children: [
              for (final document in documents) ...[
                Dismissible(
                  key: ValueKey(document.id),
                  onDismissed: (_) {
                    FirebaseFirestore.instance
                        .collection('cardio')
                        .doc(document.id)
                        .delete();
                  },
                  child: TrainingCardioHistory(
                    document['type'],
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

class TrainingCardioHistory extends StatelessWidget {
  const TrainingCardioHistory(
    this.title, {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(title),
    );
  }
}

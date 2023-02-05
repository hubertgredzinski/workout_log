import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HistoryStrengthTrainingPage extends StatelessWidget {
  const HistoryStrengthTrainingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Strength Training History'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('strength').snapshots(),
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
                        .collection('strength')
                        .doc(document.id)
                        .delete();
                  },
                  child: TrainingStrengthHistory(
                    document['exercise'],
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

class TrainingStrengthHistory extends StatelessWidget {
  const TrainingStrengthHistory(
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

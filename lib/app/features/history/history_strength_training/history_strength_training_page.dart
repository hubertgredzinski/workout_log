import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_log/app/features/history/history_strength_training/cubit/history_strength_cubit.dart';

class StrengthHistoryTrainingPage extends StatelessWidget {
  const StrengthHistoryTrainingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Strength Training History'),
      ),
      body: BlocProvider(
        create: (context) => StrengthHistoryCubit()..startStrengthHistory(),
        child: BlocBuilder<StrengthHistoryCubit, StrengthHistoryState>(
          builder: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              return Text('Wystąpił błąd w aplikacji: ${state.errorMessage}');
            }
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            final documents = state.documents;

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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          TrainingStrengthHistory(
                            document['exercise'],
                          ),
                          TrainingStrengthHistory(
                            document['bodypart'],
                          ),
                          TrainingStrengthHistory(
                            document['reps'],
                          ),
                          TrainingStrengthHistory(
                            document['sets'],
                          ),
                          TrainingStrengthHistory(
                            document['weight'],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ],
            );
          },
        ),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/strength_history_cubit.dart';

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
        create: (context) => StrengthHistoryCubit()..start(),
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
                    background: const DecoratedBox(
                      decoration: BoxDecoration(color: Colors.red),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 32.0),
                          child: Icon(
                            Icons.delete,
                          ),
                        ),
                      ),
                    ),
                    confirmDismiss: (direction) async {
                      return direction == DismissDirection.endToStart;
                    },
                    onDismissed: (direction) {
                      context
                          .read<StrengthHistoryCubit>()
                          .remove(documentID: document.id);
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

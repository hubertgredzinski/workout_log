import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cubit/cardio_history_cubit.dart';

class CardioHistoryTrainingPage extends StatelessWidget {
  const CardioHistoryTrainingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardio Training History'),
      ),
      body: BlocProvider(
        create: (context) => CardioHistoryCubit()..startCardioHistory(),
        child: BlocBuilder<CardioHistoryCubit, CardioHistoryState>(
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
                          .collection('cardio')
                          .doc(document.id)
                          .delete();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TrainingCardioHistory(
                            document['type'],
                          ),
                          TrainingCardioHistory(
                            document['time'],
                          ),
                          TrainingCardioHistory(
                            document['intensity'],
                          ),
                          TrainingCardioHistory(
                            document['kcal'],
                          )
                        ],
                      ),
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

class TrainingCardioHistory extends StatelessWidget {
  const TrainingCardioHistory(
    this.title, {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            title,
            style: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Time',
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Intensity',
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Calories',
                style:
                    GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Text(
            '22.04.23',
            style: GoogleFonts.lato(
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}

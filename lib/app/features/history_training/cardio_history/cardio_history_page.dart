import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_log/models/cardio_history_model.dart';
import 'package:workout_log/repositories/cardio_history_repository.dart';
import 'cubit/cardio_history_cubit.dart';

class CardioHistoryPage extends StatelessWidget {
  const CardioHistoryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cardio Training History'),
      ),
      body: BlocProvider(
        create: (context) => CardioHistoryCubit(CardioRepository())..start(),
        child: BlocBuilder<CardioHistoryCubit, CardioHistoryState>(
          builder: (context, state) {
            final cardioModels = state.cardioDocuments;
            return ListView(
              children: [
                for (final cardioModel in cardioModels) ...[
                  Dismissible(
                    key: ValueKey(cardioModel.id),
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
                          .read<CardioHistoryCubit>()
                          .remove(documentID: cardioModel.id);
                    },
                    child: CardioTraining(cardioDocument: cardioModel),
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

class CardioTraining extends StatelessWidget {
  const CardioTraining({
    Key? key,
    required this.cardioDocument,
  }) : super(key: key);

  final CardioHistoryModel cardioDocument;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Text(
            cardioDocument.type,
            style: GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            (cardioDocument.dateFromatted()),
            style: GoogleFonts.lato(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Intensity',
                    style: GoogleFonts.lato(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    cardioDocument.intensity.toString(),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Time',
                    style: GoogleFonts.lato(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    cardioDocument.time,
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    'Calories',
                    style: GoogleFonts.lato(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(cardioDocument.kcal),
                ],
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(211, 255, 225, 0),
            indent: 20,
            endIndent: 20,
            height: 30,
            thickness: 0.5,
          )
        ],
      ),
    );
  }
}

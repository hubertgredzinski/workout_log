import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

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
        create: (context) => CardioHistoryCubit()..start(),
        child: BlocBuilder<CardioHistoryCubit, CardioHistoryState>(
          builder: (context, state) {
            if (state.errorMessage.isNotEmpty) {
              return Text('Wystąpił błąd w aplikacji: ${state.errorMessage}');
            }
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            final documents = state.documents?.docs;
            if (documents == null) {
              return const SizedBox.shrink();
            }
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
                          .read<CardioHistoryCubit>()
                          .remove(documentID: document.id);
                    },
                    child: CardioTraining(document: document),
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
    required this.document,
  }) : super(key: key);

  final QueryDocumentSnapshot<Map<String, dynamic>> document;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Text(
            document['type'],
            style: GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            '22.04.23',
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
                    document['intensity'],
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
                  Text(document['time'])
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
                  Text(
                    document['kcal'],
                  ),
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cubit/strength_history_cubit.dart';

class StrengthHistoryPage extends StatelessWidget {
  const StrengthHistoryPage({
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
                          .read<StrengthHistoryCubit>()
                          .remove(documentID: document.id);
                    },
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StrengthTraining(document: document)),
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

class StrengthTraining extends StatelessWidget {
  const StrengthTraining({
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
            document['exercise'],
            style: GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            (document['date'] as Timestamp).toDate().toString(),
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
                    'Body Part',
                    style: GoogleFonts.lato(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    document['bodypart'],
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Sets',
                    style: GoogleFonts.lato(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    document['sets'],
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Reps',
                    style: GoogleFonts.lato(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    document['reps'],
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    'Weight',
                    style: GoogleFonts.lato(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    document['weight'],
                  )
                ],
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 211, 3, 3),
            indent: 20,
            endIndent: 20,
            height: 30,
            thickness: 0.5,
          ),
        ],
      ),
    );
  }
}

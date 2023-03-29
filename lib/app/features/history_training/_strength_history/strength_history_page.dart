import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/strength_history_model.dart';
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
            final strengthModels = state.strengthDocuments;
            return ListView(
              children: [
                for (final stengthModel in strengthModels) ...[
                  Dismissible(
                    key: ValueKey(stengthModel.id),
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
                          .remove(documentID: stengthModel.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: StrengthTraining(strengthDocument: stengthModel),
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

class StrengthTraining extends StatelessWidget {
  const StrengthTraining({
    Key? key,
    required this.strengthDocument,
  }) : super(key: key);

  final StrengthHistoryModel strengthDocument;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          Text(
            strengthDocument.exercise,
            style: GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            (strengthDocument.date).toString(),
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
                    strengthDocument.bodypart,
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
                    strengthDocument.sets,
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
                    strengthDocument.reps,
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
                  Text(strengthDocument.weight)
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

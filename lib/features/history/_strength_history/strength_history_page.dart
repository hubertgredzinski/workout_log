import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../domain/models/strength_history_model.dart';
import '../../../app/core/enums/enums.dart';
import '../../../app/core/injection_container.dart';
import 'cubit/strength_history_cubit.dart';

class StrengthHistoryPage extends StatelessWidget {
  const StrengthHistoryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/dumbbell3.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Strength Training History',
          ),
        ),
        body: BlocProvider<StrengthHistoryCubit>(
          create: (context) => getIt()..start(),
          child: BlocListener<StrengthHistoryCubit, StrengthHistoryState>(
            listener: (context, state) {
              if (state.status == Status.error) {
                final errorMessage = state.errorMessage ?? 'Unkown error';
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      errorMessage,
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: BlocBuilder<StrengthHistoryCubit, StrengthHistoryState>(
              builder: (context, state) {
                final strengthModels = state.strengthDocuments;
                return ListView(
                  children: [
                    for (final strengthModel in strengthModels) ...[
                      Dismissible(
                        key: ValueKey(strengthModel.id),
                        background: const DecoratedBox(
                          decoration: BoxDecoration(
                            color: Colors.red,
                          ),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: 32.0,
                              ),
                              child: Icon(
                                Icons.delete,
                                color: Colors.black,
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
                              .remove(documentID: strengthModel.id);
                        },
                        child: StrengthTraining(
                          strengthDocument: strengthModel,
                        ),
                      )
                    ],
                  ],
                );
              },
            ),
          ),
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
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      margin: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 10,
        bottom: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(
          30,
        ),
      ),
      child: Column(
        children: [
          Text(
            strengthDocument.exercise,
            style: GoogleFonts.lato(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            (strengthDocument.dateFromatted()),
            style: GoogleFonts.lato(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Body Part',
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      strengthDocument.bodypart!,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Sets',
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      strengthDocument.sets,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Reps',
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      strengthDocument.reps,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Weight',
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      strengthDocument.weight!,
                    )
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(255, 211, 3, 3),
            indent: 10,
            endIndent: 10,
            height: 28,
            thickness: 1.3,
          ),
        ],
      ),
    );
  }
}

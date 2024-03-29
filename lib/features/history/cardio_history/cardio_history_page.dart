import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_log/app/core/injection_container.dart';
import 'package:workout_log/domain/models/cardio_history_model.dart';
import '../../../app/core/enums/enums.dart';
import 'cubit/cardio_history_cubit.dart';

class CardioHistoryPage extends StatelessWidget {
  const CardioHistoryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/treadmill2.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Cardio Training History',
          ),
        ),
        body: BlocProvider<CardioHistoryCubit>(
          create: (context) => getIt()..start(),
          child: BlocListener<CardioHistoryCubit, CardioHistoryState>(
            listener: (context, state) {
              if (state.status == Status.error) {
                final errorMessage = state.errorMessage ?? 'Unkown error';
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(errorMessage),
                    backgroundColor: Colors.red,
                  ),
                );
              }
            },
            child: BlocBuilder<CardioHistoryCubit, CardioHistoryState>(
              builder: (context, state) {
                final cardioModels = state.cardioDocuments;
                return ListView(
                  children: [
                    for (final cardioModel in cardioModels) ...[
                      Dismissible(
                        key: ValueKey(cardioModel.id),
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
                          context.read<CardioHistoryCubit>().remove(
                                documentID: cardioModel.id,
                              );
                        },
                        child: CardioTraining(
                          cardioDocument: cardioModel,
                        ),
                      ),
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

class CardioTraining extends StatelessWidget {
  const CardioTraining({
    Key? key,
    required this.cardioDocument,
  }) : super(key: key);

  final CardioHistoryModel cardioDocument;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15,
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
            cardioDocument.type,
            style: GoogleFonts.lato(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            (cardioDocument.dateFromatted()),
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
                      'Intensity',
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      cardioDocument.intensity!,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Time',
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      cardioDocument.time,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Distance',
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      cardioDocument.distance!,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Calories',
                      style: GoogleFonts.lato(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      cardioDocument.kcal!,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: Color.fromARGB(211, 255, 225, 0),
            indent: 10,
            endIndent: 10,
            height: 28,
            thickness: 1.3,
          )
        ],
      ),
    );
  }
}

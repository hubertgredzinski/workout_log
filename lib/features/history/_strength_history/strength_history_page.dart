import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../../../domain/models/strength_history_model.dart';
import '../../../app/core/enums/enums.dart';
import '../../../app/core/injection_container.dart';
import 'cubit/strength_history_cubit.dart';

class StrengthHistoryPage extends StatefulWidget {
  const StrengthHistoryPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StrengthHistoryPage> createState() => _StrengthHistoryPageState();
}

class _StrengthHistoryPageState extends State<StrengthHistoryPage> {
  DateTime? startDate;
  DateTime? endDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  Material(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 4, bottom: 4),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              'Choose a date Range',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '${startDate != null ? DateFormat("dd, MMM").format(startDate!) : '-'} / ${endDate != null ? DateFormat("dd, MMM").format(endDate!) : '-'}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    backgroundColor: const Color.fromARGB(255, 211, 3, 3),
                    onPressed: () {
                      showCustomDateRangePicker(
                        context,
                        dismissible: true,
                        minimumDate: DateTime.now().subtract(
                          const Duration(days: 365),
                        ),
                        maximumDate: DateTime.now().add(
                          const Duration(days: 30),
                        ),
                        endDate: endDate,
                        startDate: startDate,
                        backgroundColor: Colors.black87,
                        primaryColor: const Color.fromARGB(255, 211, 3, 3),
                        onApplyClick: (start, end) {
                          setState(() {
                            endDate = end;
                            startDate = start;
                          });
                        },
                        onCancelClick: () {
                          setState(() {
                            endDate = null;
                            startDate = null;
                          });
                        },
                      );
                    },
                    child: const Icon(Icons.calendar_today_outlined,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
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
                      strengthDocument.bodypart,
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
                      strengthDocument.weight,
                    )
                  ],
                ),
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

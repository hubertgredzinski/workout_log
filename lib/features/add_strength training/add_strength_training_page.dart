import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:workout_log/features/history/_strength_history/strength_history_page.dart';
import '../../app/core/enums/enums.dart';
import '../../app/core/injection_container.dart';
import 'cubit/add_strength_training_cubit.dart';

class AddStrengthTrainingPage extends StatefulWidget {
  const AddStrengthTrainingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddStrengthTrainingPage> createState() =>
      _AddStrengthTrainingPageState();
}

class _AddStrengthTrainingPageState extends State<AddStrengthTrainingPage> {
  String? exercise;
  String? bodyPart;
  String? reps;
  String? sets;
  String? weight;
  DateTime? date;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/dumbbell3.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: BlocProvider<AddStrengthTrainingCubit>(
        create: (context) => getIt(),
        child: BlocListener<AddStrengthTrainingCubit, AddStrengthTrainingState>(
          listener: (context, state) {
            if (state.status == Status.success) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const StrengthHistoryPage(),
                ),
              );
            }
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
          child:
              BlocBuilder<AddStrengthTrainingCubit, AddStrengthTrainingState>(
            builder: (context, state) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.black87,
                  title: const Text(
                    "Add Strength Training",
                  ),
                  actions: [
                    IconButton(
                      onPressed: exercise == null ||
                              reps == null ||
                              sets == null ||
                              date == null
                          ? null
                          : () {
                              context.read<AddStrengthTrainingCubit>().add(
                                    exercise!,
                                    bodyPart,
                                    reps!,
                                    sets!,
                                    weight,
                                    date!,
                                  );
                            },
                      icon: const Icon(
                        Icons.check,
                      ),
                    ),
                  ],
                ),
                body: _AddStrengthTrainingBody(
                  onExerciseChanged: (newValue) {
                    setState(
                      () {
                        exercise = newValue;
                      },
                    );
                  },
                  onBodyPartChanged: (newValue) {
                    setState(
                      () {
                        bodyPart = newValue;
                      },
                    );
                  },
                  onSetsChanged: (newValue) {
                    setState(
                      () {
                        sets = newValue;
                      },
                    );
                  },
                  onRepsChanged: (newValue) {
                    setState(
                      () {
                        reps = newValue;
                      },
                    );
                  },
                  onWeightChanged: (newValue) {
                    setState(
                      () {
                        weight = newValue;
                      },
                    );
                  },
                  onDateChanged: (newValue) {
                    setState(
                      () {
                        date = newValue;
                      },
                    );
                  },
                  selectedDateFormatted: date == null
                      ? null
                      : DateFormat.yMMMMEEEEd().format(
                          date!,
                        ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _AddStrengthTrainingBody extends StatelessWidget {
  const _AddStrengthTrainingBody(
      {Key? key,
      required this.onExerciseChanged,
      required this.onBodyPartChanged,
      required this.onSetsChanged,
      required this.onRepsChanged,
      required this.onWeightChanged,
      required this.onDateChanged,
      this.selectedDateFormatted})
      : super(key: key);

  final Function(String) onExerciseChanged;
  final Function(String?) onBodyPartChanged;
  final Function(String) onSetsChanged;
  final Function(String) onRepsChanged;
  final Function(String?) onWeightChanged;
  final Function(DateTime?) onDateChanged;
  final String? selectedDateFormatted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        15.0,
      ),
      child: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          TextField(
            onChanged: onExerciseChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.black87,
              enabledBorder: enabledBorderView(),
              focusedBorder: focusedBorderView(),
              hintText: 'Write exercise e.g.: Squats',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            onChanged: onBodyPartChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.black87,
              enabledBorder: enabledBorderView(),
              focusedBorder: focusedBorderView(),
              hintText: 'Write part of working body e.g.: Legs',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            onChanged: onSetsChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.black87,
              enabledBorder: enabledBorderView(),
              focusedBorder: focusedBorderView(),
              hintText: 'Write number of sets e.g.: 3',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            onChanged: onRepsChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.black87,
              enabledBorder: enabledBorderView(),
              focusedBorder: focusedBorderView(),
              hintText: 'Write number of reps e.g.: 8',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            onChanged: onWeightChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.black87,
              enabledBorder: enabledBorderView(),
              focusedBorder: focusedBorderView(),
              hintText: ' Write reps weight e.g.: 30 kg',
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                side: BorderSide(color: Colors.white70),
              ),
              backgroundColor: Colors.black87,
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 18,
              ),
            ),
            onPressed: () async {
              final selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(
                  2021,
                ),
                lastDate: DateTime.now().add(
                  const Duration(
                    days: 365 * 1,
                  ),
                ),
                builder: (context, child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      colorScheme: const ColorScheme.light(
                        primary: Colors.black38,
                        onPrimary: Colors.white,
                        onSurface: Colors.white,
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white70,
                        ),
                      ),
                    ),
                    child: child!,
                  );
                },
              );
              onDateChanged(selectedDate);
            },
            child: Text(
              selectedDateFormatted ?? 'Choose training date',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  OutlineInputBorder focusedBorderView() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        15,
      ),
      borderSide: const BorderSide(
        color: Colors.white70,
        width: 3,
      ),
    );
  }

  OutlineInputBorder enabledBorderView() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        13,
      ),
      borderSide: const BorderSide(
        color: Colors.white70,
      ),
    );
  }
}

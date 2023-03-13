import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_log/app/features/add_strength%20training/cubit/add_strength_training_cubit.dart';

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
    return BlocProvider(
      create: (context) => AddStrengthTrainingCubit(),
      child: BlocBuilder<AddStrengthTrainingCubit, AddStrengthTrainingState>(
        builder: (context, state) {
          return Scaffold(
            appBar:
                AppBar(title: const Text("Add Strength Training"), actions: [
              IconButton(
                onPressed: exercise == null ||
                        bodyPart == null ||
                        reps == null ||
                        sets == null ||
                        date == null
                    ? null
                    : () {
                        context.read<AddStrengthTrainingCubit>().add(
                            exercise!, bodyPart!, reps!, sets!, weight, date!);
                      },
                icon: const Icon(Icons.check),
              ),
            ]),
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
              selectedDateFormatted: date?.toIso8601String(),
            ),
          );
        },
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
  final Function(String) onBodyPartChanged;
  final Function(String) onSetsChanged;
  final Function(String) onRepsChanged;
  final Function(String) onWeightChanged;
  final Function(DateTime?) onDateChanged;
  final String? selectedDateFormatted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        children: [
          const SizedBox(height: 50),
          TextField(
            onChanged: onExerciseChanged,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: const BorderSide(color: Colors.white12, width: 3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.orange, width: 3),
                ),
                hintText: 'Write exercise e.g.: Squats'),
          ),
          const SizedBox(height: 15),
          TextField(
            onChanged: onBodyPartChanged,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: const BorderSide(color: Colors.white12, width: 3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.orange, width: 3),
                ),
                hintText: 'Write part of working body e.g.: Legs'),
          ),
          const SizedBox(height: 15),
          TextField(
            onChanged: onSetsChanged,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: const BorderSide(color: Colors.white12, width: 3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.orange, width: 3),
                ),
                hintText: 'Write number of sets e.g.: 3'),
          ),
          const SizedBox(height: 15),
          TextField(
            onChanged: onRepsChanged,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: const BorderSide(color: Colors.white12, width: 3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.orange, width: 3),
                ),
                hintText: 'Write number of reps e.g.: 8'),
          ),
          const SizedBox(height: 15),
          TextField(
            onChanged: onWeightChanged,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(13),
                  borderSide: const BorderSide(color: Colors.white12, width: 3),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.orange, width: 3),
                ),
                hintText: ' Write reps weight e.g.: 30 kg'),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            onPressed: () async {
              final selectedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(
                  const Duration(days: 365 * 10),
                ),
              );
              onDateChanged(selectedDate);
            },
            child: Text(selectedDateFormatted ?? 'Choose training date'),
          ),
        ],
      ),
    );
  }
}

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
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddStrengthTrainingCubit(),
      child: BlocBuilder<AddStrengthTrainingCubit, AddStrengthTrainingState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Add Strength Training"),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView(
                children: [
                  const SizedBox(height: 50),
                  TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide:
                              const BorderSide(color: Colors.white12, width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(color: Colors.orange, width: 3),
                        ),
                        hintText: 'Write exercise e.g.: Squats'),
                    onChanged: (newValue) {
                      setState(
                        () {
                          exercise = newValue;
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide:
                              const BorderSide(color: Colors.white12, width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(color: Colors.orange, width: 3),
                        ),
                        hintText: 'Write part of working body e.g.: Legs'),
                    onChanged: (newValue) {
                      setState(
                        () {
                          bodyPart = newValue;
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide:
                              const BorderSide(color: Colors.white12, width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(color: Colors.orange, width: 3),
                        ),
                        hintText: 'Write number of sets e.g.: 3'),
                    onChanged: (newValue) {
                      setState(
                        () {
                          sets = newValue;
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide:
                              const BorderSide(color: Colors.white12, width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(color: Colors.orange, width: 3),
                        ),
                        hintText: 'Write number of reps e.g.: 8'),
                    onChanged: (newValue) {
                      setState(
                        () {
                          reps = newValue;
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(13),
                          borderSide:
                              const BorderSide(color: Colors.white12, width: 3),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              const BorderSide(color: Colors.orange, width: 3),
                        ),
                        hintText: ' Write reps weight e.g.: 30 kg'),
                    onChanged: (newValue) {
                      setState(
                        () {
                          weight = newValue;
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange),
                    onPressed: exercise == null ||
                            bodyPart == null ||
                            reps == null ||
                            sets == null
                        ? null
                        : () {
                            context.read<AddStrengthTrainingCubit>().add(
                                exercise!, bodyPart!, reps!, sets!, weight);
                          },
                    child: const Text('Add training'),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

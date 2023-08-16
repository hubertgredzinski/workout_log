import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:workout_log/app/core/injection_container.dart';
import '../../app/core/enums/enums.dart';
import 'cubit/add_cardio_training_cubit.dart';

class AddCardioTrainingPage extends StatefulWidget {
  const AddCardioTrainingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddCardioTrainingPage> createState() => AddCardioTrainingPageState();
}

class AddCardioTrainingPageState extends State<AddCardioTrainingPage> {
  String? type;
  String? time;
  DateTime? date;
  String? intensity;
  String? kcal;
  String? distance;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddCardioTrainingCubit>(
      create: (context) => getIt(),
      child: BlocListener<AddCardioTrainingCubit, AddCardioTrainingState>(
        listener: (context, state) {
          if (state.status == Status.success) {
            Navigator.of(context).pop();
          }
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
        child: BlocBuilder<AddCardioTrainingCubit, AddCardioTrainingState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "Add Cardio Training",
                ),
                actions: [
                  IconButton(
                    onPressed: type == null ||
                            time == null ||
                            date == null ||
                            intensity == null ||
                            kcal == null ||
                            distance == null
                        ? null
                        : () {
                            context.read<AddCardioTrainingCubit>().add(
                                  type!,
                                  time!,
                                  date!,
                                  intensity!,
                                  kcal!,
                                  distance!,
                                );
                          },
                    icon: const Icon(
                      Icons.check,
                    ),
                  ),
                ],
              ),
              body: _AddCardioTrainingBody(
                onTypeChanged: (newValue) {
                  setState(
                    () {
                      type = newValue;
                    },
                  );
                },
                onTimeChanged: (newValue) {
                  setState(
                    () {
                      time = newValue;
                    },
                  );
                },
                onIntensityChanged: (newValue) {
                  setState(
                    () {
                      intensity = newValue;
                    },
                  );
                },
                onKcalChanged: (newValue) {
                  setState(
                    () {
                      kcal = newValue;
                    },
                  );
                },
                onDistanceChanged: (newValue) {
                  setState(
                    () {
                      distance = newValue;
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
    );
  }
}

class _AddCardioTrainingBody extends StatelessWidget {
  const _AddCardioTrainingBody(
      {Key? key,
      required this.onTypeChanged,
      required this.onTimeChanged,
      required this.onIntensityChanged,
      required this.onKcalChanged,
      required this.onDistanceChanged,
      required this.onDateChanged,
      this.selectedDateFormatted})
      : super(key: key);

  final Function(String) onTypeChanged;
  final Function(String) onTimeChanged;
  final Function(String) onIntensityChanged;
  final Function(String) onKcalChanged;
  final Function(String) onDistanceChanged;
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
            onChanged: onTypeChanged,
            decoration: InputDecoration(
              enabledBorder: enabledBorderView(),
              focusedBorder: focusedBorderView(),
              hintText: 'Write type of training e.g.: Running',
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            onChanged: onTimeChanged,
            decoration: InputDecoration(
              enabledBorder: enabledBorderView(),
              focusedBorder: focusedBorderView(),
              hintText: 'Write time of training e.g.: 10 minutes',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            onChanged: onIntensityChanged,
            decoration: InputDecoration(
              enabledBorder: enabledBorderView(),
              focusedBorder: focusedBorderView(),
              hintText: 'Write intensity of training e.g.: 10 km/h',
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            onChanged: onKcalChanged,
            decoration: InputDecoration(
              enabledBorder: enabledBorderView(),
              focusedBorder: focusedBorderView(),
              hintText: 'Write number of calories burned',
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextField(
            onChanged: onDistanceChanged,
            decoration: InputDecoration(
              enabledBorder: enabledBorderView(),
              focusedBorder: focusedBorderView(),
              hintText: 'Write covered distance: 5 km',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
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
              );
              onDateChanged(
                selectedDate,
              );
            },
            child: Text(
              selectedDateFormatted ?? 'Choose training date',
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
        color: Colors.green,
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
        color: Colors.white12,
        width: 3,
      ),
    );
  }
}
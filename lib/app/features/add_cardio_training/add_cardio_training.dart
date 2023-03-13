import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/add_cardio_training_cubit.dart';

class AddCardioTrainingPage extends StatefulWidget {
  const AddCardioTrainingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddCardioTrainingPage> createState() => _AddCardioTrainingPageState();
}

class _AddCardioTrainingPageState extends State<AddCardioTrainingPage> {
  String? type;
  String? time;
  String? intensity;
  String? kcal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Cardio Training"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
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
                  hintText: 'Write type of training e.g.: Running'),
              onChanged: (newValue) {
                setState(() {
                  type = newValue;
                });
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
                  hintText: 'Write time of training e.g.: 10 minutes'),
              onChanged: (newValue) {
                setState(
                  () {
                    time = newValue;
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
                  hintText: 'Write intensity of training e.g.: 10 km/h'),
              onChanged: (newValue) {
                setState(
                  () {
                    intensity = newValue;
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
                  hintText: 'Write number of calories burned'),
              onChanged: (newValue) {
                setState(
                  () {
                    kcal = newValue;
                  },
                );
              },
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: type == null || time == null
                  ? null
                  : () {
                      context
                          .read<AddCardioTrainingCubit>()
                          .add(type!, time!, intensity, kcal);
                    },
              child: const Text('Add training'),
            )
          ],
        ),
      ),
    );
  }
}

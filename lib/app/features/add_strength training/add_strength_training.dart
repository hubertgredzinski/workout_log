import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddStrengthTrainingPage extends StatefulWidget {
  const AddStrengthTrainingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddStrengthTrainingPage> createState() =>
      _AddStrengthTrainingPageState();
}

class _AddStrengthTrainingPageState extends State<AddStrengthTrainingPage> {
  var exercise = '';
  var bodyPart = '';
  var reps = '';
  var sets = '';
  var weight = '';
  @override
  Widget build(BuildContext context) {
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
                  hintText: 'Exercise:'),
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
                  hintText: 'Part of working body:'),
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
                  hintText: 'Number of sets:'),
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
                  hintText: 'Number of reps:'),
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
                  hintText: ' Exercise weight:'),
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
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: exercise.isEmpty ||
                      bodyPart.isEmpty ||
                      reps.isEmpty ||
                      sets.isEmpty ||
                      weight.isEmpty
                  ? null
                  : () {
                      FirebaseFirestore.instance.collection('strength').add(
                        {
                          'exercise': exercise,
                          'bodypart': bodyPart,
                          'reps': reps,
                          'sets': sets,
                          'weight': weight,
                        },
                      );
                    },
              child: const Text('Add training'),
            )
          ],
        ),
      ),
    );
  }
}

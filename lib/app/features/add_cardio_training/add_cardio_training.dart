import 'package:flutter/material.dart';

class AddCardioTrainingPage extends StatefulWidget {
  const AddCardioTrainingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddCardioTrainingPage> createState() => _AddCardioTrainingPageState();
}

class _AddCardioTrainingPageState extends State<AddCardioTrainingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Cardio Training"),
        actions: const [],
      ),
      body: const Text('elo'),
    );
  }
}

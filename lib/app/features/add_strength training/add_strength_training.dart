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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Strength Training"),
      ),
      body: const Text('elo'),
    );
  }
}

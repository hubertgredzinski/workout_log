import 'package:flutter/material.dart';

class StrengthTrainingPage extends StatefulWidget {
  const StrengthTrainingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<StrengthTrainingPage> createState() => _StrengthTrainingPageState();
}

class _StrengthTrainingPageState extends State<StrengthTrainingPage> {
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

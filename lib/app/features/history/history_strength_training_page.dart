import 'package:flutter/material.dart';

class HistoryStrengthTrainingPage extends StatefulWidget {
  const HistoryStrengthTrainingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<HistoryStrengthTrainingPage> createState() =>
      _HistoryStrengthTrainingPageState();
}

class _HistoryStrengthTrainingPageState
    extends State<HistoryStrengthTrainingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text('Historia treningów siłowych'),
      appBar: AppBar(
        title: const Text('Strength Training History'),
      ),
    );
  }
}

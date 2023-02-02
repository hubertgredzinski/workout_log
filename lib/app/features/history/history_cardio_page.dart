import 'package:flutter/material.dart';

class HistoryCardioTrainingPage extends StatefulWidget {
  const HistoryCardioTrainingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<HistoryCardioTrainingPage> createState() =>
      _HistoryCardioTrainingPageState();
}

class _HistoryCardioTrainingPageState extends State<HistoryCardioTrainingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text('Historia treningów siłowych'),
      appBar: AppBar(
        title: const Text('Cardio Training History'),
      ),
    );
  }
}

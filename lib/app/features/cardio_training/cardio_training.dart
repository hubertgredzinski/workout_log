import 'package:flutter/material.dart';

class CardioTrainingPage extends StatefulWidget {
  const CardioTrainingPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CardioTrainingPage> createState() => _CardioTrainingPageState();
}

class _CardioTrainingPageState extends State<CardioTrainingPage> {
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

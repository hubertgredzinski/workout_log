import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_log/features/add_notes/cubit/add_notes_page_cubit.dart';

import '../../app/core/enums/enums.dart';

class AddNotesPage extends StatefulWidget {
  const AddNotesPage({super.key});

  @override
  State<AddNotesPage> createState() => _AddNotesPageState();
}

class _AddNotesPageState extends State<AddNotesPage> {
  String? title;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesPageCubit(),
      child: BlocListener<AddNotesPageCubit, AddNotesPageState>(
        listener: (context, state) {
          if (state.status == Status.success) {
            Navigator.of(context).pop();
          }
          if (state.status == Status.error) {
            final errorMessage = state.errorMessage ?? 'Unkown error';
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: BlocBuilder<AddNotesPageCubit, AddNotesPageState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "Add Notes",
                ),
                actions: [
                  IconButton(
                    onPressed: title == null
                        ? null
                        : () {
                            context.read<AddNotesPageCubit>().add(
                                  title!,
                                );
                          },
                    icon: const Icon(
                      Icons.check,
                    ),
                  ),
                ],
              ),
              body: AddNotesPageBody(
                onTitleChanged: (newValue) {
                  setState(
                    () {
                      title = newValue;
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class AddNotesPageBody extends StatelessWidget {
  const AddNotesPageBody({
    Key? key,
    required this.onTitleChanged,
  }) : super(key: key);
  final Function(String) onTitleChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
        onChanged: onTitleChanged,
        decoration: const InputDecoration(
          labelText: 'Notes',
          suffixIcon: Icon(
            Icons.notes_outlined,
          ),
        ),
      ),
    );
  }
}

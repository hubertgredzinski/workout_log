import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workout_log/features/add_notes/cubit/add_notes_page_cubit.dart';
import '../../app/core/enums/enums.dart';
import '../../app/core/injection_container.dart';

class AddNotesPage extends StatefulWidget {
  const AddNotesPage({super.key});

  @override
  State<AddNotesPage> createState() => _AddNotesPageState();
}

class _AddNotesPageState extends State<AddNotesPage> {
  String? title;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/notes.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: BlocProvider(
        create: (context) => AddNotesPageCubit(
          getIt(),
        ),
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
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.black87,
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
      padding: const EdgeInsets.only(
        top: 20,
        left: 15,
        right: 15,
      ),
      child: TextField(
        onChanged: onTitleChanged,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              13,
            ),
            borderSide: const BorderSide(
              color: Colors.white70,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              15,
            ),
            borderSide: const BorderSide(
              color: Colors.white70,
              width: 3,
            ),
          ),
          filled: true,
          fillColor: Colors.black87,
          labelText: 'Write notes:',
          labelStyle: const TextStyle(
            color: Colors.white70,
          ),
          suffixIcon: const Icon(
            Icons.notes_outlined,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}

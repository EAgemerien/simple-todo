import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_todo/features/todo/presentation/todo_bloc/todo_bloc.dart';
import 'package:uuid/uuid.dart';

class CreateTaskDialog extends StatelessWidget {
  const CreateTaskDialog({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController task = TextEditingController();
    String uuid = const Uuid().v1();
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: task,
                decoration: const InputDecoration(
                  labelText: 'Write your Tasks here',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final todoTask = task.text.trim();
                  context.read<TodoBloc>().add(
                        CreateTodoEvent(
                          uuid,
                          DateTime.now(),
                          todoTask,
                          false,
                        ),
                      );

                  Navigator.pop(context);
                },
                child: const Text('Add Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

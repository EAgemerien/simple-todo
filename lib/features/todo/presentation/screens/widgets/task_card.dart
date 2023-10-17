import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_todo/features/todo/presentation/todo_bloc/todo_bloc.dart';

Widget taskCard({
  required BuildContext context,
  required String task,
  required DateTime time,
  required bool isComplete,
  required String id,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Card(
      elevation: 5,
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    task,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      decoration:
                          isComplete ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  Text(
                    time.toString(),
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              isComplete
                  ? context.read<TodoBloc>().add(DeleteTodoEvent(id: id))
                  : context.read<TodoBloc>().add(CompleteTodoEvent(id: id));
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                Icons.check_circle_outline_outlined,
                size: 32,
                color: isComplete ? Colors.grey : Colors.green,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

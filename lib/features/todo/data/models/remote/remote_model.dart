import 'package:simple_todo/features/todo/domain/entities/todo.dart';

abstract class RemoteTodoModel extends Todo {
  const RemoteTodoModel({
    required super.id,
    required super.createdAt,
    required super.task,
    required super.isCompleted,
  });
}

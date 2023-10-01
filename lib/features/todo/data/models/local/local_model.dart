import 'package:hive_flutter/hive_flutter.dart';
import 'package:simple_todo/features/todo/domain/entities/todo.dart';

part 'local_model.g.dart';

@HiveType(typeId: 1)
class TodoLocalModel extends Todo {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final DateTime createdAt;

  @HiveField(2)
  final String task;

  @HiveField(3)
  final bool isCompleted;

  TodoLocalModel({
    required this.id,
    required this.createdAt,
    required this.task,
    required this.isCompleted,
  }) : super(
          id: id,
          createdAt: createdAt,
          task: task,
          isCompleted: isCompleted,
        );

  TodoLocalModel copyWith({
    String? id,
    DateTime? createdAt,
    String? task,
    bool? isCompleted,
  }) {
    return TodoLocalModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      task: task ?? this.task,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

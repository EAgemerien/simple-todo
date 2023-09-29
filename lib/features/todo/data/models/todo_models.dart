// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:simple_todo/features/todo/domain/entities/todo.dart';

class TodoModel extends Todo {
  final String id;
  final DateTime createdAt;
  final String task;
  final bool isCompleted;

  const TodoModel({
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

  TodoModel copyWith({
    String? id,
    DateTime? createdAt,
    String? task,
    bool? isCompleted,
  }) {
    return TodoModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      task: task ?? this.task,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'task': task,
      'isCompleted': isCompleted,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      task: map['task'] as String,
      isCompleted: map['isCompleted'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TodoModel(id: $id, createdAt: $createdAt, task: $task, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(covariant TodoModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.createdAt == createdAt &&
        other.task == task &&
        other.isCompleted == isCompleted;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        createdAt.hashCode ^
        task.hashCode ^
        isCompleted.hashCode;
  }
}

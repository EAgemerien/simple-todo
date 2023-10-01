import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String id;
  final DateTime createdAt;
  final String task;
  final bool isCompleted;
  const Todo({
    required this.id,
    required this.createdAt,
    required this.task,
    required this.isCompleted,
  });

  @override
  List<Object?> get props => [id, createdAt, task, isCompleted];
}

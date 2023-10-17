part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object> get props => [];
}

class CreateTodoEvent extends TodoEvent {
  final String id;
  final DateTime createdAt;
  final String task;
  final bool isCompleted;
  const CreateTodoEvent(
    this.id,
    this.createdAt,
    this.task,
    this.isCompleted,
  );

  @override
  List<Object> get props => [id, createdAt, task, isCompleted];
}

class EditTodoEvent extends TodoEvent {
  final String id;
  final String task;
  const EditTodoEvent({
    required this.id,
    required this.task,
  });

  @override
  List<Object> get props => [id, task];
}

class DeleteTodoEvent extends TodoEvent {
  final String id;
  const DeleteTodoEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class CompleteTodoEvent extends TodoEvent {
  final String id;
  const CompleteTodoEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class GetAllTodosEvent extends TodoEvent {}

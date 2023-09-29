// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:simple_todo/core/utils/typedef.dart';
import 'package:simple_todo/core/utils/usecase.dart';
import 'package:simple_todo/features/todo/domain/repositories/todo_repo.dart';

class CreateTodo extends UsecaseWithParams<void, CreateTodoParams> {
  final TodoRepo _repo;
  CreateTodo(
    this._repo,
  );

  @override
  ResultFuture call(CreateTodoParams params) async => _repo.createTodo(
        id: params.id,
        createdAt: params.createdAt,
        task: params.task,
        isCompleted: params.isCompleted,
      );
}

class CreateTodoParams extends Equatable {
  final String id;
  final DateTime createdAt;
  final String task;
  final bool isCompleted;

  const CreateTodoParams({
    required this.id,
    required this.createdAt,
    required this.task,
    required this.isCompleted,
  });

  @override
  List<Object?> get props => [id, createdAt, task, isCompleted];
}

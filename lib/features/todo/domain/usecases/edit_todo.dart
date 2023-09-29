import 'package:equatable/equatable.dart';
import 'package:simple_todo/core/utils/typedef.dart';
import 'package:simple_todo/core/utils/usecase.dart';
import 'package:simple_todo/features/todo/domain/repositories/todo_repo.dart';

class EditTodo extends UsecaseWithParams<void, EditTodoParams> {
  final TodoRepo _repo;
  EditTodo(this._repo);

  @override
  ResultFuture<void> call(EditTodoParams params) async => _repo.editTodo(
        id: params.id,
        task: params.task,
      );
}

class EditTodoParams extends Equatable {
  final String id;

  final String task;

  const EditTodoParams({
    required this.id,
    required this.task,
  });

  @override
  List<Object?> get props => [id, task];
}

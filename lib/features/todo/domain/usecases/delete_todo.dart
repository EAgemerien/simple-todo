import 'package:simple_todo/core/utils/typedef.dart';
import 'package:simple_todo/core/usecases/usecase.dart';
import 'package:simple_todo/features/todo/domain/repositories/todo_repo.dart';

class DeleteTodo extends UsecaseWithParams<void, String> {
  final TodoRepo _repo;
  DeleteTodo(this._repo);

  @override
  ResultFuture<void> call(String params) async => _repo.deleteTodo(id: params);
}

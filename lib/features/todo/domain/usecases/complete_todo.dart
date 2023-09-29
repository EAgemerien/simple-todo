import 'package:simple_todo/core/utils/typedef.dart';
import 'package:simple_todo/core/utils/usecase.dart';
import 'package:simple_todo/features/todo/domain/repositories/todo_repo.dart';

class CompleteTodo extends UsecaseWithParams<void, String> {
  final TodoRepo _repo;
  CompleteTodo(this._repo);

  @override
  ResultFuture<void> call(String params) async =>
      _repo.completeTodo(id: params);
}

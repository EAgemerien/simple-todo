// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:simple_todo/core/utils/typedef.dart';
import 'package:simple_todo/core/usecases/usecase.dart';
import 'package:simple_todo/features/todo/domain/repositories/todo_repo.dart';

class GetTodos extends UsecaseWithoutParams {
  final TodoRepo _repo;
  GetTodos(
    this._repo,
  );

  @override
  ResultFuture call() async => _repo.getTodos();
}

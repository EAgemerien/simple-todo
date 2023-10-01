// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';
import 'package:simple_todo/core/error/failure.dart';
import 'package:simple_todo/core/utils/typedef.dart';
import 'package:simple_todo/features/todo/data/sources/local/local_data_source.dart';
import 'package:simple_todo/features/todo/domain/entities/todo.dart';
import 'package:simple_todo/features/todo/domain/repositories/todo_repo.dart';

class TodoRepoImpl implements TodoRepo {
  final LocalDataSource localDataSource;
  TodoRepoImpl({
    required this.localDataSource,
  });

  @override
  ResultFutureVoid completeTodo({required String id}) async {
    final result = await localDataSource.completeTodo(id: id);
    return result;
  }

  @override
  ResultFutureVoid createTodo({
    required String id,
    required DateTime createdAt,
    required String task,
    required bool isCompleted,
  }) async {
    try {
      await localDataSource.createTodo(
        id: id,
        createdAt: createdAt,
        task: task,
        isCompleted: isCompleted,
      );
      return const Right(null);
    } catch (e) {
      return Left(
        CacheFailure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  ResultFutureVoid deleteTodo({required String id}) async {
    final result = await localDataSource.deleteTodo(id: id);
    return result;
  }

  @override
  ResultFutureVoid editTodo({required String id, required String task}) async {
    final result = await localDataSource.editTodo(
      id: id,
      task: task,
    );
    return result;
  }

  @override
  ResultFuture<List<Todo>> getTodos() async {
    final result = await localDataSource.getTodos();
    return Right(result);
  }
}

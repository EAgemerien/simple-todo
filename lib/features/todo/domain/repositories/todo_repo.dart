import 'package:simple_todo/core/utils/typedef.dart';
import 'package:simple_todo/features/todo/domain/entities/todo.dart';

abstract class TodoRepo {
  ResultFutureVoid createTodo({
    required String id,
    required DateTime createdAt,
    required String task,
    required bool isCompleted,
  });

  ResultFuture<List<Todo>> getTodos();

  ResultFutureVoid editTodo({
    required String id,
    required String task,
  });

  ResultFutureVoid deleteTodo({
    required String id,
  });

  ResultFutureVoid completeTodo({
    required String id,
  });
}

import 'package:hive/hive.dart';
import 'package:simple_todo/features/todo/data/models/local/local_model.dart';
import 'package:simple_todo/features/todo/domain/entities/todo.dart';

abstract class LocalDataSource {
  Future createTodo({
    required String id,
    required DateTime createdAt,
    required String task,
    required bool isCompleted,
  });

  Future<List<Todo>> getTodos();

  Future deleteTodo({
    required String id,
  });

  Future completeTodo({
    required String id,
  });
}

class LocalDataSourceImpl implements LocalDataSource {
  late Box<TodoLocalModel> _todoModel;

  Future<void> init() async {
    _todoModel = await Hive.openBox<TodoLocalModel>('todos');
  }

  //  Complete Todo
  @override
  Future completeTodo({required String id}) async {
    final result = _todoModel.values.firstWhere((element) => element.id == id);
    await _todoModel.put(
      id,
      TodoLocalModel(
        id: result.id,
        createdAt: result.createdAt,
        task: result.task,
        isCompleted: !result.isCompleted,
      ),
    );
  }

  //  Create Todo
  @override
  Future createTodo({
    required String id,
    required DateTime createdAt,
    required String task,
    required bool isCompleted,
  }) async {
    await _todoModel.put(
      id,
      TodoLocalModel(
        id: id,
        createdAt: createdAt,
        task: task,
        isCompleted: false,
      ),
    );
  }

  @override
  Future deleteTodo({required String id}) async {
    await _todoModel.delete(id);
  }

  @override
  Future<List<Todo>> getTodos() async {
    final todos = _todoModel.values;
    var unsorted = todos.toList();

    unsorted.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return unsorted;
  }
}

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

  Future editTodo({
    required String id,
    required String task,
  });

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
    Hive.registerAdapter(TodoLocalModelAdapter());

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
  Future editTodo({required String id, required String task}) async {
    final todoToEdit = _todoModel.values.firstWhere(
      (element) => element.id == id,
    );
    await _todoModel.put(
      id,
      TodoLocalModel(
        id: todoToEdit.id,
        createdAt: todoToEdit.createdAt,
        task: task,
        isCompleted: todoToEdit.isCompleted,
      ),
    );
  }

  @override
  Future<List<Todo>> getTodos() async {
    final todos = _todoModel.values;
    return todos.toList();
  }
}

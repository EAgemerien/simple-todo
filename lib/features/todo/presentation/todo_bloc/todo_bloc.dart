import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simple_todo/features/todo/domain/entities/todo.dart';
import 'package:simple_todo/features/todo/domain/usecases/complete_todo.dart';
import 'package:simple_todo/features/todo/domain/usecases/create_todo.dart';
import 'package:simple_todo/features/todo/domain/usecases/delete_todo.dart';
import 'package:simple_todo/features/todo/domain/usecases/edit_todo.dart';
import 'package:simple_todo/features/todo/domain/usecases/get_todos.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final CreateTodo _createTodo;
  final CompleteTodo _completeTodo;
  final DeleteTodo _deleteTodo;
  final EditTodo _editTodo;
  final GetTodos _getTodos;

  TodoBloc({
    required CreateTodo createTodo,
    required CompleteTodo completeTodo,
    required DeleteTodo deleteTodo,
    required EditTodo editTodo,
    required GetTodos getTodos,
  })  : _createTodo = createTodo,
        _completeTodo = completeTodo,
        _deleteTodo = deleteTodo,
        _editTodo = editTodo,
        _getTodos = getTodos,
        super(TodoInitialState()) {
    //  Create Task
    on<CreateTodoEvent>(
      (event, emit) async {
        emit(TodoLoadingState());
        final result = await _createTodo(
          CreateTodoParams(
            id: event.id,
            createdAt: event.createdAt,
            task: event.task,
            isCompleted: event.isCompleted,
          ),
        );
        result.fold((e) {
          emit(TodoErrorState(e.message));
        }, (r) {
          emit(const TodoSuccessfulState('Todo Added Succefully'));
        });
        add(GetAllTodosEvent());
      },
    );

    //  Get-All Todos
    on<GetAllTodosEvent>(
      (event, emit) async {
        emit(TodoLoadingState());
        final todos = await _getTodos();
        todos.fold(
          (e) => emit(TodoErrorState(e.message)),
          (todos) => emit(
            TodoLoadedState(todos),
          ),
        );
      },
    );

    // Complete Todo
    on<CompleteTodoEvent>(
      (event, emit) async {
        final result = await _completeTodo(event.id);
        result.fold(
          (e) => emit(TodoErrorState(e.message)),
          (_) => emit(const TodoSuccessfulState('Completed Todo successfully')),
        );
        add(GetAllTodosEvent());
      },
    );

    // Edit Todo
    on<EditTodoEvent>(
      (event, emit) async {
        emit(TodoLoadingState());
        final result = await _editTodo(
          EditTodoParams(
            id: event.id,
            task: event.task,
          ),
        );
        result.fold(
          (e) => emit(TodoErrorState(e.message)),
          (_) => emit(const TodoSuccessfulState('Editted Todo successfully')),
        );
        add(GetAllTodosEvent());
      },
    );

    // Delete Todo
    on<DeleteTodoEvent>(
      (event, emit) async {
        emit(TodoLoadingState());
        final result = await _deleteTodo(event.id);
        result.fold(
          (e) => emit(TodoErrorState(e.message)),
          (_) => emit(const TodoSuccessfulState('Deleted Todo successfully')),
        );
        add(GetAllTodosEvent());
      },
    );
  }
}

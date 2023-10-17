part of 'todo_bloc.dart';

sealed class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitialState extends TodoState {}

class TodoLoadedState extends TodoState {
  final List<Todo> todos;

  const TodoLoadedState(this.todos);

  @override
  List<Object> get props => [todos];
}

class TodoSuccessfulState extends TodoState {
  final String message;

  const TodoSuccessfulState(this.message);
  @override
  List<Object> get props => [message];
}

class TodoLoadingState extends TodoState {}

class TodoErrorState extends TodoState {
  final String message;

  const TodoErrorState(this.message);
  @override
  List<Object> get props => [message];
}

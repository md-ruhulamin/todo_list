part of 'todo_bloc.dart';

class TodoState {
  final List<Todo> todos;

  const TodoState({this.todos = const []});

  TodoState copyWith({List<Todo>? todos}) {
    return TodoState(todos: todos ?? this.todos);
  }
}
class TodoInitial extends TodoState {}
class TodoAddSuccess extends TodoState {
  
}
class TodoAddFailure extends TodoState {}
class LoadingState extends TodoState {}

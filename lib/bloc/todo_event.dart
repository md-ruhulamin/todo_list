part of 'todo_bloc.dart';

abstract class TodoEvent {
  const TodoEvent();
}

class AddTodoEvent extends TodoEvent {
  final Todo todo;

  const AddTodoEvent(this.todo);
}
class RemoveTodoEvent extends TodoEvent {
  final int todoId;

  const RemoveTodoEvent( this.todoId);
}
class UpdateTodoEvent extends TodoEvent {
  final int todoId;
  final Todo updatedTodo;

  const UpdateTodoEvent(this.todoId, this.updatedTodo);
}

// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:todo_list/model/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<AddTodoEvent>((event, emit) {
      if (event.todo.name.isEmpty) {
        addError("Name Cannot be Empty");
        return;
      }
      final toDo = event.todo;
      emit(state.copyWith(todos: [...state.todos, toDo]));
      
    });
on<UpdateTodoEvent>((event, emit) {
  emit(state.copyWith(
    todos: state.todos.map((todo) {
      if (todo.todoId == event.todoId) {
        return event.updatedTodo; // Replace with updated todo
      } else {
        return todo; // Keep the original todo
      }
    }).toList(),
  ));
});

    on<RemoveTodoEvent>((event, emit) {
      emit(state.copyWith(
        todos:
            state.todos.where((todo) => todo.todoId != event.todoId).toList(),
      ));
    });
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print("Todo Cubit $error");
  }
}

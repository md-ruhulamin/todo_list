import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/model/todo.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);
  void addTodo(String title) {
    if (title.isEmpty) {
      addError("Title cannot be empty");
      return;
    }

    final todo = Todo(name: title, createdAt: DateTime.now(),todoId: 4);
    emit([...state, todo]);
  }

  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    print('Todo Cubit -$change');
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    // TODO: implement onError
    super.onError(error, stackTrace);
    print("Todo Cubit $error");
  }
}

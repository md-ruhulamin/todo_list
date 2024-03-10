// ignore_for_file: use_key_in_widget_constructors, prefer_interpolation_to_compose_strings
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/bloc_ui/add_todo.dart';
import 'package:todo_list/model/todo.dart';
import '../bloc/todo_bloc.dart';

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo List Screen'),
        ),
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                        child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(255, 37, 236, 2)),
                      child: Center(
                          child: Text(index.toString(),
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.white))),
                    )),
                    title: Row(
                      children: [
                        Text(
                            state.todos[index].name +
                                "           " +
                                state.todos[index].todoId.toString(),
                            style: const TextStyle(fontSize: 17)),
                        const Expanded(child: SizedBox()),
                        InkWell(
                            onTap: () {
                              //   print(state.todos[index].todoId);
                              context.read<TodoBloc>().add(
                                  RemoveTodoEvent(state.todos[index].todoId));
                            },
                            child: const Icon(Icons.delete))
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(state.todos[index].createdAt.toString()),
                        IconButton(
                          onPressed: () async {
                            // Retrieve the todo to update
                            // final todoToUpdate = state.todos.firstWhere(
                            //     (todo) => todo.todoId == state.todos[index].todoId);

                            // Show the dialog and capture updated data
                            String updatedTitle =
                                state.todos[index].name; // Initial title
                            DateTime updatedDateTime = state
                                .todos[index].createdAt; // Initial date/time
                            await showDialog<void>(
                              context: context,
                              builder: (context) => UpdateTodoDialog(
                                initialTitle: updatedTitle,
                                initialDateTime: updatedDateTime,
                                onSubmit: (title, dateTime) {
                                  print("IN main file");
                                  updatedTitle = title;
                                  updatedDateTime = dateTime;

                                  context.read<TodoBloc>().add(UpdateTodoEvent(
                                      state.todos[index].todoId,
                                      Todo(
                                          name: updatedTitle,
                                          createdAt: updatedDateTime,
                                          todoId: state.todos[index].todoId)));
                                  // Close the dialog
                                  Navigator.pop(context);
                                },
                              ),
                            );
                          },
                          icon: Icon(Icons.update),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: ((context) => AddTodoScreen()))),
          child: const Icon(Icons.add),
        ));
  }
}

class UpdateTodoDialog extends StatelessWidget {
  final String initialTitle;
  final DateTime initialDateTime;
  final Function(String title, DateTime dateTime) onSubmit;

  const UpdateTodoDialog({
    Key? key,
    required this.initialTitle,
    required this.initialDateTime,
    required this.onSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller =
        TextEditingController(text: initialTitle);
    return AlertDialog(
      title: Text('Update Todo'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(hintText: 'Enter todo title'),
          ),
          // Add a date/time picker here for initialDateTime
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            onSubmit(_controller.text.trim(), initialDateTime);
            print("Outside function");
          },
          child: Text('Update'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
      ],
    );
  }
}

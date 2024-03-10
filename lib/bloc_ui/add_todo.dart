import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/model/todo.dart';
import '../bloc/todo_bloc.dart';
class AddTodoScreen extends StatelessWidget {
  final _controller = TextEditingController();
  AddTodoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(hintText: 'Enter todo'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                int randomInt = 5 + Random().nextInt(586);
                context.read<TodoBloc>().add(AddTodoEvent(Todo(
                    name: _controller.text,
                    createdAt: DateTime.now(),
                    todoId: randomInt)));
                _controller.clear();
                Navigator.pop(context);
              },
              child: const Text('Add'),
            )
          ],
        ),
      ),
    );
  }
}

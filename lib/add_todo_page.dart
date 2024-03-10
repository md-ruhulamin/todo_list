// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:todo_list/cubit/todo_cubit.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
   final todoCubit = TodoCubit();

  @override
  Widget build(BuildContext context) {
    final todoTitledController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: todoTitledController,
                decoration: InputDecoration(
                  hintText: "Title",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    //BlocProvider.of<TodoCubit>(context).addTodo(todoTitledController.text.trim());
                   
                    Navigator.pop(context);
                  },
                  child: Text("Add"))
            ],
          ),
        ),
      ),
    );
  }
}

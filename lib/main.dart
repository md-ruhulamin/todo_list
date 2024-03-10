import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/add_todo_page.dart';
import 'package:todo_list/bloc/todo_bloc.dart';
import 'package:todo_list/bloc_ui/list.dart';
import 'package:todo_list/cubit/todo_cubit.dart';
import 'package:todo_list/todolist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodoCubit(),
        ),
        BlocProvider(create: (context) => TodoBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
           //'/': (_) => TodoList(),
        '/':(_)=>TodoListScreen(),

          '/add-todo': (_) => const AddTodoPage(),
        },
      ),
    );
  }
}

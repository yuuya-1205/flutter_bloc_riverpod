import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_riverpod/data/repository/todo_repository.dart';
import 'package:flutter_bloc_riverpod/domain/bloc/todo_bloc.dart';

/// BlocのテストとRiverpodのテストを書いてみるかな。
class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(context.read<TodoRepository>()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Todo List')),
        body: const Center(child: Text('Todo List')),
      ),
    );
  }
}

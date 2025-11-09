import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_riverpod/domain/bloc/todo_bloc.dart';
import 'package:flutter_bloc_riverpod/domain/bloc/todo_event.dart';
import 'package:flutter_bloc_riverpod/domain/model/todo.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: BlocBuilder<TodoBloc, List<Todo>>(
        builder: (context, state) {
          return Column(
            children: [
              StreamBuilder<List<Todo>>(
                stream: context.read<TodoBloc>().todoStream(),
                builder: (context, snapshot) {
                  final todos = snapshot.data ?? [];
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      return Text(snapshot.data?[index].title ?? '');
                    },
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<TodoBloc>().add(AddTodoEvent('こんばんは'));
                },
                child: const Text('add Todo'),
              ),
            ],
          );
        },
      ),
    );
  }
}

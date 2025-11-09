import 'package:flutter/material.dart';
import 'package:flutter_bloc_riverpod/data/repository/todo_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            return StreamBuilder(
              stream: ref.watch(todoRepositoryProvider).fetchTodos(),
              builder: (context, snapshot) {
                return Column(
                  children: [
                    Text('${snapshot.data?.length} todos'),
                    ElevatedButton(
                      onPressed: () =>
                          ref.read(todoRepositoryProvider).addTodo('test'),
                      child: const Text('Add Todo'),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

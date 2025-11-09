import 'package:flutter/material.dart';
import 'package:flutter_bloc_riverpod/data/dto/todo_dto.dart';
import 'package:flutter_bloc_riverpod/data/repository/todo_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodTodoListPage extends StatelessWidget {
  const RiverpodTodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: Consumer(
        builder: (context, ref, child) {
          return StreamBuilder<List<TodoDto>>(
            stream: ref.watch(todoRepositoryProvider).fetchTodos(),
            builder: (context, asyncSnapshot) {
              return ListView.builder(
                itemCount: asyncSnapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return Text(asyncSnapshot.data?[index].title ?? '');
                },
              );
            },
          );
        },
      ),
    );
  }
}

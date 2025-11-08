import 'package:flutter_bloc_riverpod/data/dto/todo_dto.dart';
import 'package:flutter_bloc_riverpod/data/repository/firebase_firestore_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  return TodoRepository(ref);
});

class TodoRepository {
  TodoRepository(this.ref);

  final Ref ref;

  Future<List<TodoDto>> fetchTodos() async {
    final todos = await ref
        .read(firebaseFirestoreProvider)
        .collection('todos')
        .get();
    return todos.docs
        .map((doc) => TodoDto(title: doc.data()['title'] as String))
        .toList();
  }
}

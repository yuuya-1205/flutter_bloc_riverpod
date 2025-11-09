import 'package:flutter_bloc_riverpod/data/dto/todo_dto.dart';
import 'package:flutter_bloc_riverpod/data/repository/firebase_firestore_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  return TodoRepository(ref);
});

class TodoRepository {
  TodoRepository(this.ref);

  final Ref ref;

  Stream<List<TodoDto>> fetchTodos() {
    return ref
        .read(firebaseFirestoreProvider)
        .collection('todos')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => TodoDto(title: doc.data()['title'] as String))
              .toList(),
        );
  }

  Future<void> addTodo(String title) async {
    await ref.read(firebaseFirestoreProvider).collection('todos').add({
      'title': title,
    });
  }
}

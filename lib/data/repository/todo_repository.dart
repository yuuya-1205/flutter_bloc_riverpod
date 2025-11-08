import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  return TodoRepository(ref);
});

class TodoRepository {
  TodoRepository(this.ref);

  final Ref ref;
}

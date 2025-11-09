import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_riverpod/domain/bloc/todo_event.dart';
import 'package:flutter_bloc_riverpod/domain/model/todo.dart';

class TodoBloc extends Bloc<TodoEvent, List<Todo>> {
  TodoBloc() : super(const [Todo(title: '')]) {
    on<AddTodoEvent>(_onAddTodo);
    //  on<SubscribeToTodosEvent>(_subscribeToTodos);
  }

  Stream<List<Todo>> todoStream() {
    return FirebaseFirestore.instance
        .collection('todos')
        .snapshots()
        .map(
          (snapshot) => snapshot.docs
              .map((doc) => Todo(title: doc.data()['title'] as String))
              .toList(),
        );
  }

  Future<Todo> fetchTodos() async {
    final todo = await FirebaseFirestore.instance.collection('todos').get();
    return Todo(title: todo.docs.first.data()['title'] as String);
  }

  void _onAddTodo(AddTodoEvent event, Emitter<List<Todo>> emit) async {
    await FirebaseFirestore.instance.collection('todos').add({
      'title': event.title,
    });
    emit([...state, Todo(title: event.title)]);
  }
}

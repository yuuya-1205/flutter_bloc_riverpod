import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
  @override
  List<Object> get props => [];
}

class AddTodoEvent extends TodoEvent {
  const AddTodoEvent(this.title);

  final String title;

  @override
  List<Object> get props => [title];
}

class SubscribeToTodosEvent extends TodoEvent {
  const SubscribeToTodosEvent();

  @override
  List<Object> get props => [];
}

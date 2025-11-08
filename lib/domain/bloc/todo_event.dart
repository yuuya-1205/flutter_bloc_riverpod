import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();

  @override
  List<Object?> get props => [];
}

class LoadTodosEvent extends TodoEvent {
  const LoadTodosEvent();
}

class AddTodoEvent extends TodoEvent {
  const AddTodoEvent(this.title);

  final String title;

  @override
  List<Object?> get props => [title];
}

class UpdateTodoEvent extends TodoEvent {
  const UpdateTodoEvent({required this.todoId, this.title, this.isCompleted});

  final String todoId;
  final String? title;
  final bool? isCompleted;

  @override
  List<Object?> get props => [todoId, title, isCompleted];
}

class DeleteTodoEvent extends TodoEvent {
  const DeleteTodoEvent(this.todoId);

  final String todoId;

  @override
  List<Object?> get props => [todoId];
}

class ToggleTodoEvent extends TodoEvent {
  const ToggleTodoEvent(this.todoId);

  final String todoId;

  @override
  List<Object?> get props => [todoId];
}

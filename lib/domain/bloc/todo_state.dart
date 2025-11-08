import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_riverpod/domain/model/todo_model.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object?> get props => [];
}

class TodoInitial extends TodoState {
  const TodoInitial();
}

class TodoLoading extends TodoState {
  const TodoLoading();
}

class TodoLoaded extends TodoState {
  const TodoLoaded(this.todos);

  final List<TodoModel> todos;

  @override
  List<Object?> get props => [todos];
}

class TodoError extends TodoState {
  const TodoError(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}


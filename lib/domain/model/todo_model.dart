import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  const TodoModel({
    required this.todoId,
    required this.title,
    required this.isCompleted,
  });

  final String todoId;
  final String title;
  final bool isCompleted;

  TodoModel copyWith({String? todoId, String? title, bool? isCompleted}) {
    return TodoModel(
      todoId: todoId ?? this.todoId,
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [todoId, title, isCompleted];
}

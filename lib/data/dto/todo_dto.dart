import 'package:equatable/equatable.dart';

class TodoDto extends Equatable {
  const TodoDto({
    required this.todoId,
    required this.title,
    required this.isCompleted,
  });

  final String todoId;
  final String title;
  final bool isCompleted;

  @override
  List<Object?> get props => [todoId, title, isCompleted];
}

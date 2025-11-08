import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_riverpod/data/repository/todo_repository.dart';
import 'package:flutter_bloc_riverpod/domain/bloc/todo_event.dart';
import 'package:flutter_bloc_riverpod/domain/bloc/todo_state.dart';
import 'package:flutter_bloc_riverpod/domain/model/todo_model.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc(this._repository) : super(const TodoInitial()) {
    on<LoadTodosEvent>(_onLoadTodos);
    on<AddTodoEvent>(_onAddTodo);
    on<UpdateTodoEvent>(_onUpdateTodo);
    on<DeleteTodoEvent>(_onDeleteTodo);
    on<ToggleTodoEvent>(_onToggleTodo);
  }

  final TodoRepository _repository;

  Future<void> _onLoadTodos(
    LoadTodosEvent event,
    Emitter<TodoState> emit,
  ) async {
    emit(const TodoLoading());
    try {
      // TODO: Repository からデータを取得する実装を追加.
      // final todos = await _repository.getTodos();
      // final todoModels = todos.map((dto) => dto.toModel()).toList();
      // emit(TodoLoaded(todoModels));

      // 暫定実装.
      emit(const TodoLoaded([]));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  Future<void> _onAddTodo(AddTodoEvent event, Emitter<TodoState> emit) async {
    if (state is! TodoLoaded) return;

    try {
      // TODO: Repository に追加する実装を追加.
      // await _repository.addTodo(event.title);
      // add(const LoadTodosEvent());

      // 暫定実装.
      final currentState = state as TodoLoaded;
      final newTodo = TodoModel(
        todoId: DateTime.now().millisecondsSinceEpoch.toString(),
        title: event.title,
        isCompleted: false,
      );
      emit(TodoLoaded([...currentState.todos, newTodo]));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  Future<void> _onUpdateTodo(
    UpdateTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    if (state is! TodoLoaded) return;

    try {
      // TODO: Repository を更新する実装を追加.
      // await _repository.updateTodo(...);
      // add(const LoadTodosEvent());

      // 暫定実装.
      final currentState = state as TodoLoaded;
      final updatedTodos = currentState.todos.map((todo) {
        if (todo.todoId == event.todoId) {
          return todo.copyWith(
            title: event.title ?? todo.title,
            isCompleted: event.isCompleted ?? todo.isCompleted,
          );
        }
        return todo;
      }).toList();
      emit(TodoLoaded(updatedTodos));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  Future<void> _onDeleteTodo(
    DeleteTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    if (state is! TodoLoaded) return;

    try {
      // TODO: Repository から削除する実装を追加.
      // await _repository.deleteTodo(event.todoId);
      // add(const LoadTodosEvent());

      // 暫定実装.
      final currentState = state as TodoLoaded;
      final updatedTodos = currentState.todos
          .where((todo) => todo.todoId != event.todoId)
          .toList();
      emit(TodoLoaded(updatedTodos));
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }

  Future<void> _onToggleTodo(
    ToggleTodoEvent event,
    Emitter<TodoState> emit,
  ) async {
    if (state is! TodoLoaded) return;

    try {
      final currentState = state as TodoLoaded;
      final todo = currentState.todos.firstWhere(
        (t) => t.todoId == event.todoId,
      );
      add(
        UpdateTodoEvent(todoId: event.todoId, isCompleted: !todo.isCompleted),
      );
    } catch (e) {
      emit(TodoError(e.toString()));
    }
  }
}

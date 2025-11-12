import 'dart:async';
import 'package:bloc/bloc.dart';
import 'todo_event.dart';
import 'todo_state.dart';
import '../models/todo_model.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<Todo> _todos = [];

  TodoBloc() : super(TodoInitial()) {
    on<AddTodo>((event, emit) async {
      emit(TodoLoading());
      await Future.delayed(const Duration(seconds: 2));
      _todos.add(event.todo);
      emit(TodoLoaded(List.from(_todos)));
    });

    on<UpdateTodo>((event, emit) async {
      emit(TodoLoading());
      await Future.delayed(const Duration(seconds: 2));
      final index = _todos.indexWhere((t) => t.id == event.todo.id);
      if (index != -1) {
        _todos[index] = event.todo;
      }
      emit(TodoLoaded(List.from(_todos)));
    });

    on<DeleteTodo>((event, emit) async{
      emit(TodoLoading());
      await Future.delayed(const Duration(seconds: 2));
      _todos.removeWhere((t) => t.id == event.id);
      emit(TodoLoaded(List.from(_todos)));
    });
  }
}

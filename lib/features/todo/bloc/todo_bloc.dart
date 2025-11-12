import 'package:bloc/bloc.dart';
import 'todo_event.dart';
import 'todo_state.dart';
import '../models/todo_model.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final List<Todo> _todos = [];

  TodoBloc() : super(TodoInitial()) {
    on<AddTodo>((event, emit) {
      _todos.add(event.todo);
      emit(TodoLoaded(List.from(_todos)));
    });

    on<UpdateTodo>((event, emit) {
      final index = _todos.indexWhere((t) => t.id == event.todo.id);
      if (index != -1) {
        _todos[index] = event.todo;
      }
      emit(TodoLoaded(List.from(_todos)));
    });

    on<DeleteTodo>((event, emit) {
      _todos.removeWhere((t) => t.id == event.id);
      emit(TodoLoaded(List.from(_todos)));
    });
  }
}

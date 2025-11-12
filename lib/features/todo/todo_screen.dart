import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningbloc/features/todo/bloc/todo_bloc.dart';
import 'package:learningbloc/features/todo/bloc/todo_event.dart';
import 'package:learningbloc/features/todo/bloc/todo_state.dart';
import 'package:learningbloc/features/todo/models/todo_model.dart';
import 'package:uuid/uuid.dart';

class TodoScreen extends StatelessWidget {
  TodoScreen({super.key});

  final TextEditingController _controller = TextEditingController();
  final Uuid uuid = Uuid();
  final TodoBloc todoBloc = TodoBloc(); // local bloc instance

  @override
  Widget build(BuildContext context) {
    return BlocListener<TodoBloc, TodoState>(
      bloc: todoBloc, // use local instance
      listener: (context, state) {
        if (state is TodoLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Todos updated! Total: ${state.todos.length}'),
              duration: Duration(seconds: 1),
            ),
          );
        }
      },
      child: BlocBuilder<TodoBloc, TodoState>(
        bloc: todoBloc, // use same local instance
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text('Todo App')),
            body: _buildBody(state),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _showAddDialog(context),
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(TodoState state) {
    if (state is TodoInitial) {
      return Center(child: Text('No todos yet!'));
    } else if(state is TodoLoading){
      return Center(child: CircularProgressIndicator(),);
    }
    else if (state is TodoLoaded) {
      if (state.todos.isEmpty) return Center(child: Text('No todos yet!'));
      return ListView.builder(
        itemCount: state.todos.length,
        itemBuilder: (context, index) {
          final todo = state.todos[index];
          return ListTile(
            title: Text(
              todo.title,
              style: TextStyle(
                decoration:
                todo.isCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
            leading: Checkbox(
              value: todo.isCompleted,
              onChanged: (value) {
                todoBloc.add(UpdateTodo(todo.copyWith(isCompleted: value)));
              },
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => todoBloc.add(DeleteTodo(todo.id)),
            ),
          );
        },
      );
    }
    return SizedBox();
  }

  void _showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Add Todo'),
        content: TextField(controller: _controller),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                final todo = Todo(id: uuid.v4(), title: _controller.text);
                todoBloc.add(AddTodo(todo));
              }
              _controller.clear();
              Navigator.pop(context);
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }
}

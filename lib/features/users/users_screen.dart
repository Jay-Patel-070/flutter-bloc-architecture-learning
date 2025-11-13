import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningbloc/features/users/bloc/user_bloc.dart';
import 'package:learningbloc/features/users/bloc/user_event.dart';
import 'package:learningbloc/features/users/bloc/user_state.dart';
import 'package:learningbloc/features/users/data/user_repository.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final userBloc = UserBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userBloc.add(FetchUsers());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              userBloc.add(FetchUsers());
            },
          ),
        ],
      ),
      body: BlocListener<UserBloc, UserState>(
        bloc: userBloc,
        listener: (context, state) {
          if (state is UserError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: ${state.message}")),
            );
          }
        },
        child: BlocBuilder<UserBloc, UserState>(
          bloc: userBloc,
          builder: (context, state) {
            if (state is UserLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserLoaded) {
              final users = state.userModel.users!;
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (_, index) {
                  final user = users[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.image ?? ""),
                    ),
                    title: Text("${user.firstName} ${user.lastName}"),
                    subtitle: Text(user.email ?? ""),
                  );
                },
              );
            } else if (state is UserError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('Loading users...'));
          },
        ),
      ),
    );
  }
}

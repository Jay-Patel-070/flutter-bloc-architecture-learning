import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningbloc/features/darklightmode/light_screen.dart';
import 'package:learningbloc/features/login/bloc/login_bloc.dart';
import 'package:learningbloc/features/login/bloc/login_event.dart';
import 'package:learningbloc/features/login/bloc/login_state.dart';
import 'package:get/get.dart';
import 'package:learningbloc/features/login/model/login_request_model.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loginBloc = LoginBloc();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Get.snackbar(
              '',
              '',
              titleText: Center(
                child: Text(
                  'Login successfull',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.green,
              colorText: Colors.white,
              messageText: SizedBox.shrink(),
              padding: EdgeInsets.symmetric(vertical: 8),
            );
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LightScreen()),
              (route) => false,
            );
          } else if (state is LoginFailure) {
            Get.snackbar(
              '',
              '',
              titleText: Center(
                child: Text(
                  state.message.toString(),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.red,
              colorText: Colors.white,
              messageText: SizedBox.shrink(),
              padding: EdgeInsets.symmetric(vertical: 8),
            );
          }
        },
        bloc: loginBloc,
        child: BlocBuilder(
          bloc: loginBloc,
          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Password'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final username = usernameController.text.trim();
                      final password = passwordController.text.trim();

                      loginBloc.add(
                        onLoginButtonPressed(loginrequestmodel: LoginRequestModel(
                          username: username,
                          password: password
                        )),
                      );
                    },
                    child: const Text('Login'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

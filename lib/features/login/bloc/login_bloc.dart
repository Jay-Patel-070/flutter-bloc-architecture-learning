import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningbloc/features/darklightmode/light_screen.dart';
import 'package:learningbloc/features/login/bloc/login_event.dart';
import 'package:learningbloc/features/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<onLoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      await Future.delayed(Duration(seconds: 2)); // simulate API call

      // dummy validation
      if (event.email == "test@gmail.com" && event.password == "1234") {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure("Invalid email or password"));
      }
    });
  }
}

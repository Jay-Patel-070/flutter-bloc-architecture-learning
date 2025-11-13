import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningbloc/features/darklightmode/light_screen.dart';
import 'package:learningbloc/features/login/bloc/login_event.dart';
import 'package:learningbloc/features/login/bloc/login_state.dart';
import 'package:learningbloc/features/login/data/login_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginRepository loginrepository = LoginRepository();
  LoginBloc() : super(LoginInitial()) {
    on<onLoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try{
        final response = await loginrepository.login(
        event.loginrequestmodel?.username ?? '',
            event.loginrequestmodel?.password ?? ''
        );
        emit(LoginSuccess(loginresponsemodel: response));
      }catch(e){
        emit(LoginFailure(e.toString()));
      }
    });
  }
}

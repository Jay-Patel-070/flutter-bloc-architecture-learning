import 'package:learningbloc/features/login/model/login_response_model.dart';

class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  LoginResponseModel loginresponsemodel;
  LoginSuccess({required this.loginresponsemodel});
}

class LoginFailure extends LoginState {
  final String message;
  LoginFailure(this.message);
}

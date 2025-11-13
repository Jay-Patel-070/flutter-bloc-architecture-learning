import 'package:learningbloc/features/login/model/login_request_model.dart';

sealed class LoginEvent {}

class onLoginButtonPressed extends LoginEvent {
  LoginRequestModel? loginrequestmodel;
  onLoginButtonPressed({this.loginrequestmodel});
}

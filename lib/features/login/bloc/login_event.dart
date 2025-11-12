sealed class LoginEvent {}

class onLoginButtonPressed extends LoginEvent {
  String email;
  String password;
  onLoginButtonPressed({required this.email, required this.password});
}

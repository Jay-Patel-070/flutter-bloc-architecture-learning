class LoginRequestModel {
  String? username;
  String? password;
  int? expiresInMins;

  LoginRequestModel({this.username, this.password, this.expiresInMins});

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    expiresInMins = json['expiresInMins'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['expiresInMins'] = this.expiresInMins;
    return data;
  }
}

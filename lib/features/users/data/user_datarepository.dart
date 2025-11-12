import 'package:learningbloc/features/users/data/user_datasource.dart';
import 'package:learningbloc/features/users/model/user_model.dart';

class UserDatarepository {
  final UserDatasource userdatasource;

  UserDatarepository({required this.userdatasource});

  Future<UserModel> getUsers() async {
    final data = await userdatasource.fetchUsers();
    return UserModel.fromJson(data);
  }
}

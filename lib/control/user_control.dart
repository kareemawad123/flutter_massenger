import 'package:dio/dio.dart';
import 'package:first_day/model/user_model.dart';

String url = 'https://jsonplaceholder.typicode.com';
final dio = Dio();

class UserService {
  static Future<List<UserModel>> userData() async {
    List<UserModel> users = [];
    try {
      var response = await dio.get('$url/users');
      response.data.forEach((element) {
        UserModel user = UserModel.fromJson(element);
        users.add(user);
      });
    } catch (e) {
      print(e);
    }
    return users;
  }
  static Future<UserModel?> getOneUserById(int id) async {
    UserModel ? user;
    try {
      var response = await dio.get('$url/users/$id');
      user = UserModel.fromJson(response.data);
      print(user);
    } catch (e) {
      print(e);
    }
    return user;
  }
}

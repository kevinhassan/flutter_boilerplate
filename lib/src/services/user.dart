import 'dart:convert';

import 'package:flutter_boilerplate/src/models/user.dart';
import 'package:flutter_boilerplate/src/services/service.dart';

class UserService extends Service {
  static final UserService _instance = new UserService._internal();

  factory UserService() {
    return _instance;
  }
  UserService._internal() : super('user');

  Future<List<User>> getUsers() async {
    final List result = await networkUtil.get("users");
    List<User> users = [];
    result.forEach((user) => users.add(User.fromJson(user)));
    return Future.value(users);
  }
}

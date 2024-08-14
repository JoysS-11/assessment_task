import 'dart:convert';

import 'package:assessment_task/config/api_config.dart';
import 'package:assessment_task/model/user_view_model.dart';

import '../networking/api_base_helper.dart';

class UserController {
  final ApiBaseHelper helper = ApiBaseHelper();

  Future<List<UserViewModel>> fetchUsers() async {
    final response = await helper.get(ApiConfig.users);
    var value = json.decode(response.body);
    List data = value;
    return data.map((e) => UserViewModel.fromMap(e)).toList();
  }
}

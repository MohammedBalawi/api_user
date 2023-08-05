import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:untitled6/api/api_settings.dart';
import 'package:untitled6/models/user.dart';


class UsersApiController {
  Future<List<User>> getUsers() async {
    Uri uri = Uri.parse(ApiSettings.users);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var dataJsonArray = jsonResponse['data'] as List;
      return dataJsonArray
          .map((jsonObjectMap) => User.fromJson(jsonObjectMap))
          .toList();
    }
    return [];
  }
}

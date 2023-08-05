import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:untitled6/api/api_settings.dart';
import 'package:untitled6/models/api_response.dart';
import 'package:untitled6/models/student.dart';
import 'package:untitled6/prefe/shared_pref_controller.dart';
import 'package:untitled6/utils/api_helper.dart';

class ApiAuthController with ApiHelper{
  Future<ApiResponse> login(
      {required String email, required String password}) async {
    Uri uri = Uri.parse(ApiSettings.login);
    var response = await http.post(uri, body: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      if (response.statusCode == 200) {
        Student student = Student.fromJson(jsonResponse['object']);
        SharedPrefController().save(student);
      }
      return ApiResponse(jsonResponse['message'], jsonResponse['status']);
    }
    return errorResponse;
  }

  Future<ApiResponse> register(Student student) async {
    Uri uri = Uri.parse(ApiSettings.register);
    var response = await http.post(uri,body: {
      'full_name':student.fullName,
      'email':student.email,
      'gender':student.gender,
      'password': student.password,
    });

    if(response.statusCode == 201 || response.statusCode == 400) {
      var jsonResponse = jsonDecode(response.body);
      return ApiResponse(jsonResponse['message'], jsonResponse['status']);
    }
    return errorResponse;
  }
  
  Future<ApiResponse> logout() async {
    String token = SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;
    Uri uri = Uri.parse(ApiSettings.logout);
    var response = await http.get(uri,headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.acceptHeader: 'application/json'
    });

    print(response.statusCode);
    if(response.statusCode == 200 || response.statusCode == 401) {
      if(response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        return ApiResponse(jsonResponse['message'], jsonResponse['status']);
      }
      return ApiResponse('Logged out successfully', true);
    }
    return errorResponse;
  }
/**
 * API Response Structure - Dart
 * 1) Define URI in api settings as String
 * 2) Create a new function responsible to execute the new api request
 *    1) Convert URI from String to URI
 *    2) Make await http.methodType, method type same as api request
 *      -> GET, POST, PUT, DELETE
 *    3) If request requires a body (POST,PUT), define it using body parameter {}
 *      ->
 *      : {key: value, ...}
 *    4) The awaited request will return response
 *      -> response contains:
 *        -> status
 *        -> body
 *    5) Check the status code, if(response.statusCode == 200) ....
 *    6) Convert body from string to JSON using
 *      -> jsonDecode(response.body)
 *    7) Do required action on decoded data.
 */
}

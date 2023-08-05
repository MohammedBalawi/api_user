import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:untitled6/api/api_imge_respo.dart';
import 'package:untitled6/api/api_settings.dart';
import 'package:untitled6/models/api_response.dart';
import 'package:untitled6/models/imges.dart';
import 'package:untitled6/prefe/shared_pref_controller.dart';
import 'package:untitled6/utils/api_helper.dart';

class ImagesApiController with ApiHelper {
  Future<Object> uploadImage(String path) async {
    Uri uri = Uri.parse(ApiSettings.images.replaceFirst('/{id}', ''));
    var request = http.MultipartRequest('POST', uri);
    var imageFile = await http.MultipartFile.fromPath(' image', path);
    request.files.add(imageFile);
    request.headers[HttpHeaders.acceptHeader] = 'application/jsn';
    request.headers[HttpHeaders.authorizationHeader] =
    SharedPrefController().getValueFor<String>(key: PrefKeys.token.name)!;
    var response = await request.send();
    var body = await response.stream
        .transform(utf8.decoder)
        .first;
    var jsonResponse = jsonDecode(body);
    if (response.statusCode == 201 || response.statusCode == 400) {
      var apiResponse = ApiImageResponse(
          message: jsonResponse['message'], success: jsonResponse['status']);
      if (response.statusCode == 201) {
        StudentImage studentImage = StudentImage.fromJson(
            jsonResponse[ 'object' ]
        );
        apiResponse.object = studentImage;
        return apiResponse;
      }
    }
    // return ApiImageResponse(message: 'Something went wrong', success: false);
    return errorResponse;
  }

  Future<List<StudentImage>> read() async {
    Uri uri = Uri.parse(ApiSettings.images.replaceFirst('/{id}', ''));
    var response = await http.get(uri ,headers: headers);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var jsonArray = jsonResponse ['data'] as List;
      return jsonArray.map ((jsonObject) => StudentImage.fromJson (jsonObject))
          .toList();
    }
    return [];
  }
  Future<ApiResponse> delete (int id) async {
    Uri uri = Uri.parse(ApiSettings.images.replaceFirst('{id}', id.toString()));
    var response = await http. delete (uri, headers: headers) ;
    if (response .statusCode == 200) {
      var jsonResponse = jsonDecode (response .body) ;
      var  apiResponse = ApiImageResponse(
          message: jsonResponse['message'], success: jsonResponse['status']);
    }
    return errorResponse;
  }
}
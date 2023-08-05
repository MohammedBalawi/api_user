import 'dart:io';

import 'package:untitled6/models/api_response.dart';
import 'package:untitled6/prefe/shared_pref_controller.dart';

mixin ApiHelper {
  ApiResponse get errorResponse => ApiResponse('Something went wrong', false);
  Map<String, String> get headers {
    return {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.authorizationHeader: SharedPrefController().getValueFor<
          String>(key: PrefKeys.token.name)!
    };
  }
}

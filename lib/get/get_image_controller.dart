import 'package:get/get.dart';
import 'package:untitled6/api/api_imge_respo.dart';
import 'package:untitled6/api/images_api_controller.dart';
import 'package:untitled6/models/api_response.dart';
import 'package:untitled6/models/imges.dart';

class GetImageController extends GetxController{
  static GetImageController get to => Get. find<GetImageController> ();
  RxList<StudentImage> images = <StudentImage>[].obs;
  final ImagesApiController _apiController = GetImageController() as ImagesApiController;

  @override
  void onInit() {
  read();
  super.onInit ();}

  Future<void> upload (String path) async {
    ApiImageResponse<StudentImage> apiResponse =  _apiController.uploadImage(path) as ApiImageResponse<StudentImage>;
    if (apiResponse.success && apiResponse.object != null) {
      images.add (apiResponse.object!);}
  }

void read()async{
  images.value = await _apiController.read();
}

Future<void> delete(int index) async {}

}
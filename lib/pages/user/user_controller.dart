import 'dart:io';
// import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  File? imageUser;
  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageCamera = File(image.path);
    imageUser = imageCamera;
    print('IMAGEGGGGGGGGGG ${imageUser}');
    // String fileName = imageCamera.path.split('/').last;
    // dio.FormData formData = dio.FormData.fromMap({
    //   "file": await dio.MultipartFile.fromFile(imageCamera.path,
    //       filename: fileName),
    // });
    update();
  }

  Future getPhoto() async {
    final ImagePicker _picker = ImagePicker();
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageCamera = File(image.path);
    imageUser = imageCamera;
    // String fileName = imageCamera.path.split('/').last;
    // dio.FormData formData = dio.FormData.fromMap({
    //   "file": await dio.MultipartFile.fromFile(imageCamera.path,
    //       filename: fileName),
    // });
    update();
  }
}

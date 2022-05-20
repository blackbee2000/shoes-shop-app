import 'dart:io';
// import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shoes_shop_app/pages/profile/profile_controller.dart';
import 'package:shoes_shop_app/pages/user/user_provider.dart';
import 'package:shoes_shop_app/services/api_token.dart';

class UserController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  File? imageUser;
  final profileController = Get.put(ProfileController());

  @override
  void onInit() async {
    super.onInit();
    name.text = profileController.profile.value.fullName ?? "";
    phone.text = profileController.profile.value.phoneNumber ?? "";
    email.text = profileController.profile.value.email ?? "";
  }

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

  updateProfile(String name, String phone, String email) {
    print('PROFILE =>>>>>>> ${DateTime.now().toUtc().toString()}');
    // UserProvider().updateProfile(
    //   params: {
    //     "fullName": name,
    //     "phoneNumber": phone,
    //     "email": email,
    //     "password": profileController.profile.value.password,
    //     "role": profileController.profile.value.role,
    //     "_id": "6218a6b2e767b4274c0c7122",
    //     "createdAt": profileController.profile.value.createdAt,
    //     "updatedAt": DateTime.now().toUtc().toString()
    //   },
    //   option: Options(
    //     headers: {
    //       'Content-Type': 'application/json; charset=UTF-8',
    //       'Authorization': 'Bearer ${ApiToken.to.appToken}',
    //     },
    //   ),
    //   beforeSend: () {
    //     Get.dialog(
    //       const SizedBox(
    //         height: 15,
    //         width: 15,
    //         child: Center(
    //           child: CircularProgressIndicator(
    //             valueColor: AlwaysStoppedAnimation(Colors.white),
    //             strokeWidth: 2,
    //           ),
    //         ),
    //       ),
    //       barrierDismissible: false,
    //     );
    //   },
    //   onSuccess: (res) {
    //     print('UPDATE PROFILE SUCESSS =>>>>>> ${res.toString()}');
    //     update();
    //   },
    //   onError: (e) {
    //     Get.snackbar(
    //       'Fail',
    //       'Lỗi cập nhật thông tin',
    //       colorText: Colors.black,
    //       backgroundColor: Colors.white,
    //     );
    //     print('UPDATE PROFILE FAIL =>>> ${e.toString()}');
    //     update();
    //   },
    // );
  }
}

import 'dart:io';
// import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shoes_shop_app/pages/dashboard/dashboard_page.dart';
import 'package:shoes_shop_app/pages/profile/profile_controller.dart';
import 'package:shoes_shop_app/pages/user/user_provider.dart';
import 'package:shoes_shop_app/services/api_token.dart';

class UserController extends GetxController with StateMixin {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  String? imageUser;
  final profileController = Get.put(ProfileController());
  bool isLoading = false;

  @override
  void onInit() async {
    super.onInit();
  }

  Future getImage(String id) async {
    isLoading = true;
    update();
    final fireStorage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    String imagefilename =
        profileController.profile.value.id! + DateTime.now().toString();
    XFile? image;
    //Check permission
    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select Image
      // ignore: deprecated_member_use
      image = await _picker.pickImage(source: ImageSource.camera);
      if (image == null) {
        return;
      }
      var file = File(image.path);
      //Upload to Firebase
      var snapshot = await fireStorage.ref().child(imagefilename).putFile(file);
      var download = await snapshot.ref.getDownloadURL();
      print(download);

      imageUser = download;
      isLoading = false;
      update();
    } else {
      print('Grant Permission and try again');
    }
  }

  Future getPhoto(String id) async {
    isLoading = true;
    update();
    final fireStorage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    String imagefilename =
        profileController.profile.value.id! + DateTime.now().toString();
    XFile? image;
    //Check permission
    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select Image
      // ignore: deprecated_member_use
      image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      var file = File(image.path);
      //Upload to Firebase
      var snapshot = await fireStorage.ref().child(imagefilename).putFile(file);
      var download = await snapshot.ref.getDownloadURL();
      print(download);

      imageUser = download;
      isLoading = false;
      update();
    } else {
      print('Grant Permission and try again');
    }
    update();
  }

  updateProfile(String name, String phone, String email, String image) {
    print('PROFILE =>>>>>>> ${DateTime.now().toUtc().toString()}');
    UserProvider().updateProfile(
      params: {
        "fullName": name,
        "phoneNumber": phone,
        "avatar": image,
        "email": email,
        "password": profileController.profile.value.password,
        "role": profileController.profile.value.role,
        "_id": profileController.profile.value.id,
        "createdAt": profileController.profile.value.createdAt,
        "updatedAt": DateTime.now().toUtc().toString()
      },
      option: Options(
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ${ApiToken.to.appToken}',
        },
      ),
      beforeSend: () {
        Get.dialog(
          const SizedBox(
            height: 15,
            width: 15,
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
                strokeWidth: 2,
              ),
            ),
          ),
          barrierDismissible: false,
        );
        print('IDDDDD ${profileController.profile.value.id}');
      },
      onSuccess: (res) {
        print('UPDATE PROFILE SUCESSS =>>>>>> ${res.toString()}');
        profileController.onInit();
        profileController.update();
        Future.delayed(const Duration(milliseconds: 1000)).then((_) {
          Get.offAll(const DashboardPage());
        });
        update();
      },
      onError: (e) {
        Get.snackbar(
          'Fail',
          'Lỗi cập nhật thông tin',
          colorText: Colors.black,
          backgroundColor: Colors.white,
        );
        print('UPDATE PROFILE FAIL =>>> ${e.toString()}');
        update();
      },
    );
  }
}

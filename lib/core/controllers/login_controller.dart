import 'package:currency_app/core/repository/base_repository.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../features/home_layout/ui/layout_page.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  BaseRepository repository = BaseRepository();
  bool isLoading = false;
  final GetStorage _box = GetStorage();

  @override
  void onInit() {
    // Simulating obtaining the user name from some local storage
    emailController.text = '';
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? validator(String? value) {
    if (value!.isEmpty) {
      return 'لا يمكن ترك هذا الحقل فارغ';
    }
    return null;
  }

  void login() {
    isLoading = true;
    if (loginFormKey.currentState!.validate()) {
      repository.setPostRequest("https://exchangemoneyapp.herokuapp.com/auth/jwt/create/", {
        "email": emailController.text,
        "password": passwordController.text
      }).then((value) {
        if (value.status.code == 200){
          _box.write("token", value.body["access"]);
          _box.save();
           Get.off(() => const LayoutPage());
           isLoading = false;
        }else if(value.status.code == 401){
          isLoading = false;
          Get.snackbar('تسجيل الدخول', "اسم المستخدم وكلمة المرور غير متطابقين");
        }
      }).onError((error, stackTrace) {
        isLoading = false;
        Get.snackbar('تسجيل الدخول', " تعذر تسجيل الدخول");
      });
      //passwordController.clear();
    }
  }
}

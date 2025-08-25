import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/core/constant/routes.dart';

abstract class LoginController extends GetxController {
  login();

  goToSignUp();

  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  @override
  void login() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      // Get.offNamed(AppRoute.home);
    } else {
      Get.snackbar("Error", "Please fill in all fields correctly");
    }
  }

  @override
  void goToSignUp() {
    Get.toNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }

  @override
  void goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}

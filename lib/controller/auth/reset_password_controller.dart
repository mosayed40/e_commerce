import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/core/constant/routes.dart';

abstract class ReastPasswordController extends GetxController {
  resetPassword();

  goToSuccessResetPassword();
}

class ReastPasswordControllerImp extends ReastPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController password;
  late TextEditingController repassword;

  @override
  void resetPassword() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      if (password.text == repassword.text) {
        Get.offNamed(AppRoute.successResetPassword);
      } else {
        Get.snackbar("Error", "Passwords do not match");
        return;
      }
    } else {
      Get.snackbar("Error", "Please fill in all fields correctly");
    }
  }

  @override
  void goToSuccessResetPassword() {
    // Get.offNamed(AppRoute.successResetPassword);
  }

  @override
  void onInit() {
    password = TextEditingController();
    repassword = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    password.dispose();
    repassword.dispose();
    super.onClose();
  }
}

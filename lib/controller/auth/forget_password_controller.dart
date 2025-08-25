import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/core/constant/routes.dart';

abstract class ForgetPasswordController extends GetxController {
  checkEmail();

  goToVerfiyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController email;

  @override
  void checkEmail() {
    var formData = formState.currentState;
    if (formData!.validate()) {
      Get.toNamed(AppRoute.verfiyCode);
    } else {
      Get.snackbar("Error", "Please fill in all fields correctly");
    }
  }

  @override
  void goToVerfiyCode() {
    // Get.toNamed(AppRoute.verfiyCode);
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    super.onClose();
  }
}

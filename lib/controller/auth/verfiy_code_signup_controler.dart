import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/core/constant/routes.dart';

abstract class VirfiyCodeSignUpController extends GetxController {
  checkCode();

  goToSuccessSignUp();
}

class VirfiyCodeSignUpControllerImp extends VirfiyCodeSignUpController {
  late TextEditingController otpController;
  @override
  void checkCode() {}

  @override
  void goToSuccessSignUp() {
    Get.offNamed(AppRoute.successSignUp);
  }

  @override
  void onInit() {
    otpController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }
}

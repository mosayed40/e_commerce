import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/core/constant/routes.dart';

abstract class VirfiyCodeController extends GetxController {
  checkCode();

  goToReastPassword();
}

class VirfiyCodeControllerImp extends VirfiyCodeController {
  late TextEditingController otpController;
  @override
  void checkCode() {}

  @override
  void goToReastPassword() {
    Get.offNamed(AppRoute.resetPassword);
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

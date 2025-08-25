import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/controller/auth/login_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:lottie/lottie.dart';
import 'package:e_commerce_app/core/constant/image_asset.dart';
import 'package:e_commerce_app/core/functions/valid_input.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_body_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_form_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_signUp.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_title_auth.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp myController = Get.put(LoginControllerImp());
    bool isShowPassword = true;

    showPassword() {
      isShowPassword = isShowPassword == true ? false : true;
      myController.update();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Center(
          child: Text(
            "9".tr,
            style: TextStyle(color: AppColors.textColor_2, fontSize: 20),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        alignment: Alignment.center,
        child: Form(
          key: myController.formState,
          child: ListView(
            children: [
              Icon(
                Icons.account_circle_outlined,
                size: 150,
                color: AppColors.buttonColor,
              ),
              Lottie.asset(
                AppImageAsset.iconLogin,
                height: 150,
                width: 150,
                // fit: BoxFit.fill,
              ),

              // Icon(
              //   Icons.account_circle_outlined,
              //   size: 150,
              //   color: AppColors.buttonColor,
              // ),
              const SizedBox(height: 20),
              const CustomTextTitleAuth(textTitle: "titleSignPages"),
              const SizedBox(height: 10),
              const CustomTextBodyAuth(textBody: "bodySignPages"),
              const SizedBox(height: 60),
              CustomTextFormAuth(
                valid: (val) {
                  return VaildInput(val!, 6, 50, "email");
                },
                labelText: "labelEmail",
                hintText: "lintEmail",
                suffixIcon: Icons.email_outlined,
                myController: myController.email,
              ),
              SizedBox(height: 15),
              CustomTextFormAuth(
                valid: (val) {
                  return VaildInput(val!, 5, 30, "password");
                },
                labelText: "labelPassword",
                hintText: "lintPasword",
                suffixIcon: Icons.lock_outlined,
                myController: myController.password,
              ),
              GetBuilder<LoginControllerImp>(
                builder:
                    (controller) => CustomTextFormAuth(
                      obscureText: isShowPassword,
                      onTapIcon: () {
                        showPassword();
                      },
                      valid: (val) {
                        return VaildInput(val!, 5, 30, "password");
                      },
                      labelText: "labelPassword",
                      hintText: "lintPasword",
                      suffixIcon: Icons.lock_outlined,
                      myController: myController.password,
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      myController.goToForgetPassword();
                    },
                    child: Text(
                      "forgetPassword".tr,
                      style: TextStyle(color: AppColors.textColor_2),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              CustomButtonAuth(
                text: "login".tr,
                onPressed: () {
                  myController.login();
                },
              ),
              const SizedBox(height: 20),
              CustomTextSignUp(
                textBody: "textNavgetorPageSignIn".tr,
                textLink: "linkNavgetorPageSignIn".tr,
                onPressed: () {
                  myController.goToSignUp();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

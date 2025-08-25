import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:e_commerce_app/controller/auth/signUp_controller.dart';
import 'package:e_commerce_app/core/constant/colors.dart';
import 'package:e_commerce_app/core/functions/valid_input.dart';
import 'package:e_commerce_app/view/widget/auth/custom_button_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_body_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_form_auth.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_signUp.dart';
import 'package:e_commerce_app/view/widget/auth/custom_text_title_auth.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  SignUpControllerImp get myController => SignUpControllerImp();

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp myController = Get.put(SignUpControllerImp());

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
            "signUp".tr,
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
              const SizedBox(height: 20),
              const CustomTextTitleAuth(textTitle: "titleSignPages"),
              const SizedBox(height: 10),
              const CustomTextBodyAuth(textBody: "bodySignUpPage"),
              const SizedBox(height: 60),
              CustomTextFormAuth(
                valid: (val) {
                  return VaildInput(val!, 6, 50, "userName");
                },
                labelText: "lintUserName",
                hintText: "lintUserName",
                suffixIcon: Icons.person_outline,

                myController: myController.username,
              ),
              const SizedBox(height: 15),
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
                  return VaildInput(val!, 9, 15, "phone");
                },
                labelText: "labelPhone",
                hintText: "lintPhone",
                suffixIcon: Icons.phone_outlined,
                myController: myController.phone,
              ),
              const SizedBox(height: 15),
              CustomTextFormAuth(
                valid: (val) {
                  return VaildInput(val!, 5, 30, "password");
                },
                labelText: "labelPassword",
                hintText: "lintPasword",
                suffixIcon: Icons.lock_outlined,
                myController: myController.password,
              ),
              GetBuilder<SignUpControllerImp>(
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

              const SizedBox(height: 30),
              CustomButtonAuth(
                text: "signUp",
                onPressed: () {
                  myController.signUp();
                },
              ),
              const SizedBox(height: 20),
              CustomTextSignUp(
                textBody: "textNavgetorPageSignUp",
                textLink: "linkNavgetorPageSignUp",
                onPressed: () {
                  myController.goToSignIN();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

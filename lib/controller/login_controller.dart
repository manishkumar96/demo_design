import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsignup/ui/bottombar_screen.dart';
import 'package:loginsignup/ui/forgot_password.dart';
import 'package:loginsignup/ui/signup_page.dart';

class LoginController extends GetxController {
  RxBool visiblePassword = true.obs;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  var context;

  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  signIn() {
    if (!GetUtils.isEmail(emailController.text.toString()) ||
        GetUtils.isBlank(emailController.text.toString())!) {
      Get.showSnackbar(const GetSnackBar(
        message: "enter valid email",
      ));
    } else if (GetUtils.isBlank(passController.text.toString())! ||
        GetUtils.isLengthLessThan(passController.text.toString(), 6) ||
        !regex.hasMatch(passController.text.toString())) {
      Get.showSnackbar(const GetSnackBar(
        message:
            "Password contains symbols,characters and numbers and of 6 length,capital and small letter",
      ));
    } else {
      FocusScope.of(context).requestFocus(FocusNode());
      Get.to(() => BottomBarScreen());
    }
  }

  signUp() {
    Get.to(() => SignUpPage());
  }

  forgotPassword() {
    Get.to(() => ForgotPassword());
  }

  @override
  void onClose() {
    emailController.dispose();
    passController.dispose();
    super.onClose();
  }
}

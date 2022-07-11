import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsignup/ui/editprofile_page.dart';

class ChangePasswordController extends GetxController {
  RxBool visiblePassword = true.obs;
  RxBool visibleConfPassword = true.obs;
  final passController = TextEditingController();
  final confPassController = TextEditingController();
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  verifyOtp() {
    if (GetUtils.isBlank(passController.text.toString())! ||
        GetUtils.isLengthLessThan(passController.text.toString(), 6) ||
        !regex.hasMatch(passController.text.toString())) {
      Get.showSnackbar(const GetSnackBar(
        message:
            "Password contains symbols,characters and numbers and of 6 length,capital and small letter",
      ));
    } else if (GetUtils.isBlank(confPassController.text.toString())! ||
        confPassController.text.toString() != passController.text.toString()) {
      Get.showSnackbar(const GetSnackBar(
        message: 'Confirm Password not match',
      ));
    } else {
      Get.to(() => EditProfileScreen());
    }
  }
}

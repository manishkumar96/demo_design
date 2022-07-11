import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsignup/ui/enterotp_page.dart';

class ForgotController extends GetxController {
  final phoneController = TextEditingController();

  forgot() {
    if (GetUtils.isBlank(phoneController.text.toString())!) {
      Get.showSnackbar(const GetSnackBar(
        message: "Enter Phone Number",
      ));
    } else {
      Get.to(() => EnterOtpPage(phone: phoneController.text.toString()));
    }
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }
}

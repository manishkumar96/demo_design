import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsignup/helper/string_helper.dart';
import 'package:loginsignup/ui/change_password.dart';
import 'package:loginsignup/widgets/text_widgets.dart';

class EnterOtpController extends GetxController {
  StringHelper stringHelper = StringHelper.getInstance;
  late Timer timer;
  var timerValue = 60;
  var start;

  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  startTimer() {
    start = timerValue.obs;
    print("startTimer");
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start == 0) {
        timer.cancel();
      } else {
        start--;
      }
    });
  }

  openDialog(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var height = screenSize.height;
    var width = screenSize.width;

    Dialog dialog = Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        height: height * 0.3,
        // width: width - 20,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:
                    EdgeInsets.only(left: height * 0.04, right: height * 0.04),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: stringHelper.otpVerification,
                      margin: EdgeInsets.only(top: height * 0.04),
                      fontSize: 20,
                      color: Color(0xFF222C82),
                      fontFamily: stringHelper.tiemposSemibold,
                      fontWeight: FontWeight.bold,
                    ),
                    Center(
                      child: TextWidget(
                        text: stringHelper.otpVerified,
                        margin: EdgeInsets.only(top: height * 0.04),
                        fontSize: 15,
                        color: const Color(0xFF75777D),
                        fontFamily: stringHelper.nunito,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height * 0.02),
                child: const Divider(
                  height: 4,
                  color: Colors.grey,
                ),
              ),
              Center(
                child: TextWidget(
                  onTap: () {
                    Get.back();
                    Get.to(() => ChangePassword());
                  },
                  width: width,
                  text: stringHelper.ok,
                  margin: EdgeInsets.only(top: height * 0.014),
                  fontSize: 21,
                  color: Color(0xFF00A7FF),
                  fontFamily: stringHelper.tiemposSemibold,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => dialog);
  }

  // Get.defaultDialog(
  //     title: stringHelper.otpVerification,
  //     middleText:
  //         "OTP has been successfully verified Kindly create your new password.",
  //     textCancel: "OK"
  //     // content: Column(
  //     //   mainAxisSize: MainAxisSize.min,
  //     //   children: [
  //     //     Container(
  //     //       padding: EdgeInsets.only(
  //     //           top: height * 0.02,
  //     //           left: width * 0.01,
  //     //           right: width * 0.01,
  //     //           bottom: height * 0.01),
  //     //       child: Text(stringHelper.otpVerification),
  //     //     ),
  //     //   ],
  //     // )
  //     );
  // }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}

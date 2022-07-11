import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loginsignup/controller/enterotp_controller.dart';
import 'package:loginsignup/helper/color_helper.dart';
import 'package:loginsignup/helper/string_helper.dart';
import 'package:loginsignup/widgets/button_widget.dart';
import 'package:loginsignup/widgets/otp_field.dart';
import 'package:loginsignup/widgets/text_widgets.dart';
import 'package:pinput/pinput.dart';

class EnterOtpPage extends StatelessWidget {
  final String phone;

  EnterOtpPage({Key? key, required this.phone}) : super(key: key);

  final StringHelper stringHelper = StringHelper.getInstance;
  final ColorHelper colorHelper = ColorHelper.getInstance;
  final EnterOtpController otpController = Get.put(EnterOtpController());

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var height = screenSize.height;
    var width = screenSize.width;
    return SafeArea(
        child: Scaffold(
      appBar: appBarWidget(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 25, right: 25, bottom: 35),
          child: Column(
            children: [
              imageWidget(),
              verificationText(context, height, width),
              sentVerification(context, height, width),
              enterOtp(height, width),
              timeSecond(height, width),
              verifyBtn(context, height, width),
              resendOtp(context, height, width),
            ],
          ),
        ),
      ),
    ));
  }

  PreferredSizeWidget appBarWidget() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget imageWidget() {
    return Center(
      child: Image.asset(
        stringHelper.forgot,
        height: 126,
        width: 126,
      ),
    );
  }

  Widget verificationText(BuildContext context, double height, double width) {
    return TextWidget(
      margin: EdgeInsets.only(top: height * 0.1),
      text: stringHelper.verificationText,
      color: colorHelper.blueColor,
      fontFamily: stringHelper.tiemposSemibold,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
  }

  Widget sentVerification(BuildContext context, double height, double width) {
    return TextWidget(
      margin: EdgeInsets.only(top: height * 0.02),
      text: "${stringHelper.sentVerification} ${phone.toString()}",
      fontFamily: stringHelper.nunito,
      fontWeight: FontWeight.w500,
      fontSize: 15,
      color: colorHelper.greyColor,
    );
  }

  Widget enterOtp(double height, double width) {
    return OtpField(
      length: 5,
      defaultPinTheme: PinTheme(
        width: 56,
        height: 56,
        textStyle: const TextStyle(
            fontSize: 20,
            color: Color.fromRGBO(30, 60, 87, 1),
            fontWeight: FontWeight.w600),
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      margin: EdgeInsets.only(top: height * 0.15),
    );
  }

  Widget timeSecond(double height, double width) {
    return Obx(() => TextWidget(
          margin: EdgeInsets.only(top: height * 0.02),
          text: "${otpController.start}${stringHelper.seconds}",
          decorationThickness: 2,
          fontSize: 13,
          fontFamily: stringHelper.montserratSemibold,
          fontWeight: FontWeight.w500,
          decorationColor: colorHelper.lightBlueColor,
          decoration: TextDecoration.underline,
          color: colorHelper.lightBlueColor,
        ));
  }

  Widget verifyBtn(BuildContext context, double height, double width) {
    return ButtonWidget(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        otpController.openDialog(context);
      },
      text: stringHelper.verifyOTP,
      margin: EdgeInsets.only(top: height * 0.05),
      height: height * 0.08,
      color: colorHelper.whiteColor,
      fontWeight: FontWeight.w500,
      fontFamily: stringHelper.montserratSemibold,
      fontSize: 17,
    );
  }

  Widget resendOtp(BuildContext context, double height, double width) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        // otpController.start;
        otpController.startTimer();
      },
      child: TextWidget(
        margin: EdgeInsets.only(top: height * 0.02),
        text: stringHelper.resendOTP,
        decorationThickness: 2,
        decoration: TextDecoration.underline,
        decorationColor: colorHelper.yellowColor,
        color: colorHelper.yellowColor,
      ),
    );
  }
}

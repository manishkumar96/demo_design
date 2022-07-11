import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsignup/controller/change_password_controller.dart';

import '../helper/color_helper.dart';
import '../helper/string_helper.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_widgets.dart';
import '../widgets/textfield_widget.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({Key? key}) : super(key: key);
  final StringHelper stringHelper = StringHelper.getInstance;
  final ColorHelper colorHelper = ColorHelper.getInstance;
  final ChangePasswordController passwordController =
      Get.put(ChangePasswordController());

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
          padding: const EdgeInsets.only(left: 25, right: 25, bottom: 35),
          child: Column(
            children: [
              imageWidget(),
              changePassword(context, height, width),
              enterNewPass(context, height, width),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  newPassText(context, height, width),
                  newPassField(context, height, width),
                  newconfPassText(context, height, width),
                  confPassField(context, height, width),
                ],
              ),
              confirmBtn(context, height, width),
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

  Widget changePassword(BuildContext context, double height, double width) {
    return TextWidget(
      margin: EdgeInsets.only(top: height * 0.1),
      text: stringHelper.changePassword,
      color: colorHelper.blueColor,
      fontFamily: stringHelper.andadaPro,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    );
  }

  Widget enterNewPass(BuildContext context, double height, double width) {
    return TextWidget(
      margin: EdgeInsets.only(top: height * 0.02),
      text: stringHelper.enterNewPassword,
      fontFamily: stringHelper.nunito,
      fontWeight: FontWeight.w500,
      fontSize: 15,
      color: colorHelper.greyColor,
    );
  }

  Widget confirmBtn(BuildContext context, double height, double width) {
    return ButtonWidget(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        passwordController.verifyOtp();
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

  Widget newPassText(BuildContext context, double height, double width) {
    return TextWidget(
        margin: EdgeInsets.only(top: height * 0.03),
        fontFamily: stringHelper.nunito,
        fontSize: 14,
        color: colorHelper.greyColor,
        fontWeight: FontWeight.bold,
        text: stringHelper.newPassword);
  }

  Widget newPassField(BuildContext context, double height, double width) {
    return Obx(() => (TextFieldWidget(
          fontWeight: FontWeight.normal,
          fontFamily: stringHelper.nunito,
          controller: passwordController.passController,
          keyboardType: TextInputType.visiblePassword,
          maxLines: 1,
          textInputAction: TextInputAction.next,
          obscureText: passwordController.visiblePassword.value,
          suffixIcon: IconButton(
            icon: Icon(passwordController.visiblePassword.value
                ? Icons.visibility_off
                : Icons.visibility),
            onPressed: () {
              passwordController.visiblePassword.value =
                  !passwordController.visiblePassword.value;
            },
          ),
        )));
  }

  Widget newconfPassText(BuildContext context, double height, double width) {
    return TextWidget(
        margin: EdgeInsets.only(top: height * 0.03),
        fontFamily: stringHelper.nunito,
        fontSize: 14,
        color: colorHelper.greyColor,
        fontWeight: FontWeight.bold,
        text: stringHelper.confNewPassword);
  }

  Widget confPassField(BuildContext context, double height, double width) {
    return Obx(() => (TextFieldWidget(
          fontWeight: FontWeight.normal,
          fontFamily: stringHelper.nunito,
          controller: passwordController.confPassController,
          keyboardType: TextInputType.visiblePassword,
          maxLines: 1,
          textInputAction: TextInputAction.next,
          obscureText: passwordController.visibleConfPassword.value,
          suffixIcon: IconButton(
            icon: Icon(passwordController.visibleConfPassword.value
                ? Icons.visibility_off
                : Icons.visibility),
            onPressed: () {
              passwordController.visibleConfPassword.value =
                  !passwordController.visibleConfPassword.value;
            },
          ),
        )));
  }
}

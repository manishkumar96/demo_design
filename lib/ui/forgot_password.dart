import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loginsignup/controller/forgot_controller.dart';
import 'package:loginsignup/helper/color_helper.dart';
import 'package:loginsignup/helper/string_helper.dart';
import 'package:loginsignup/widgets/button_widget.dart';
import 'package:loginsignup/widgets/text_widgets.dart';
import 'package:loginsignup/widgets/textfield_widget.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);

  final StringHelper stringHelper = StringHelper.getInstance;
  final ColorHelper colorHelper = ColorHelper.getInstance;
  final ForgotController forgotController = Get.put(ForgotController());

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var height = screenSize.height;
    var width = screenSize.width;
    return SafeArea(
        child: Scaffold(
      appBar: appBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            imageWidget(),
            forgotText(context, height),
            registerNumberWidget(height, context),
            Container(
              padding: const EdgeInsets.all(25),
              margin: EdgeInsets.only(top: height * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  textPhone(height, context, width),
                  textFieldWidget(
                    height,
                    context,
                    width,
                  ),
                  changeEmail(context, height, width),
                  otpButton(context, height, width),
                ],
              ),
            )
          ],
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

  Widget forgotText(BuildContext context, double height) {
    return Container(
        margin: EdgeInsets.only(top: height * 0.08),
        child: TextWidget(
          text: stringHelper.forgotText,
          fontSize: 20,
          color: colorHelper.blueColor,
          fontFamily: stringHelper.tiemposSemibold,
          fontWeight: FontWeight.w500,
        ));
  }

  Widget registerNumberWidget(double height, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.02),
      child: TextWidget(
        text: stringHelper.registerNumber,
        fontWeight: FontWeight.w500,
        color: colorHelper.greyColor,
        fontFamily: stringHelper.nunito,
        fontSize: 15,
      ),
    );
  }

  Widget textPhone(double height, BuildContext context, double width) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.01),
      // width: width,
      child: TextWidget(
        text: stringHelper.phone,
      ),
    );
  }

  Widget textFieldWidget(double height, BuildContext context, double width) {
    return TextFieldWidget(
      margin: EdgeInsets.only(top: height * 0.01),
      obscureText: false,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      inputFormatters: [LengthLimitingTextInputFormatter(10)],
      fontSize: 15,
      fontFamily: stringHelper.montserratSemibold,
      fontWeight: FontWeight.w500,
      controller: forgotController.phoneController,
    );
  }

  Widget changeEmail(BuildContext context, double height, double width) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.1),
      child: Center(
        child: TextWidget(
          decorationColor: colorHelper.yellowColor,
          decoration: TextDecoration.underline,
          text: stringHelper.changeEmailText,
          color: colorHelper.yellowColor,
        ),
      ),
    );
  }

  Widget otpButton(BuildContext context, double height, double width) {
    return ButtonWidget(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        forgotController.forgot();
      },
      margin: EdgeInsets.only(top: height * 0.1),
      text: stringHelper.sendOtp,
      height: height * 0.06,
      fontSize: 17,
      fontWeight: FontWeight.w500,
      fontFamily: stringHelper.montserratSemibold,
      color: colorHelper.whiteColor,
    );
  }
}

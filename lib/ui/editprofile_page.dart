import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loginsignup/helper/color_helper.dart';
import 'package:loginsignup/helper/string_helper.dart';
import 'package:loginsignup/widgets/image_widget.dart';
import 'package:loginsignup/widgets/text_widgets.dart';
import 'package:loginsignup/widgets/textfieldIcon.dart';
import 'package:loginsignup/widgets/textfield_widget.dart';

import '../widgets/button_widget.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);
  final StringHelper stringHelper = StringHelper.getInstance;
  final ColorHelper colorHelper = ColorHelper.getInstance;

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
          padding: const EdgeInsets.all(29.0),
          child: Column(
            children: [
              Container(
                // color: Colors.grey,
                width: height * 0.12,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    /*Center(child:*/ userImageWidget(height, width) /*)*/,
                    cameraImageWidget(height, width),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  nameWidget(height, width),
                  nameFieldWidget(height, width),
                  userNameWidget(height, width),
                  userNameFieldWidget(height, width),
                  emailTextWidget(height, width),
                  emailTextFieldWidget(height, width),
                  phoneTextWidget(height, width),
                  phoneTextFieldWidget(height, width),
                  countryTextWidget(height, width),
                  countryTextFieldWidget(height, width),
                  communityTextWidget(height, width),
                  communityTextFieldWidget(height, width),
                  interestTextWidget(height, width),
                  interestTextFieldWidget(height, width),
                  bioTextWidget(height, width),
                  bioTextFieldWidget(height, width),
                  hobbiesTextWidget(height, width),
                  hobbiesTextFieldWidget(height, width),
                  saveBtn(height, width, context),
                ],
              ),
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
      centerTitle: true,
      title: TextWidget(
        text: stringHelper.profile,
        color: colorHelper.textColor,
        fontWeight: FontWeight.bold,
        fontFamily: stringHelper.andadaPro,
        fontSize: 17,
      ),
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

  Widget userImageWidget(double height, double width) {
    return ImageWidget(
      name: stringHelper.userIcon,
      margin: EdgeInsets.only(top: height * 0.04),
      height: height * 0.12,
      width: height * 0.12,
      color: colorHelper.imageColor,
      padding: const EdgeInsets.all(30),
    );
  }

  Widget cameraImageWidget(double height, double width) {
    return /* Positioned(
      top: 10,
      left: 0,
      child:*/
        ImageWidget(
      name: stringHelper.camera,
      height: height * 0.04,
      width: height * 0.04,
      color: colorHelper.blueColor,
      padding: const EdgeInsets.all(10),
      // margin: EdgeInsets.only(top: height * 0.1, left: width * 0.49),
      /*   ),*/
    );
  }

  Widget nameWidget(double height, double width) {
    return TextWidget(
      textAlign: TextAlign.start,
      width: double.infinity,
      fontFamily: stringHelper.nunito,
      margin: EdgeInsets.only(top: height * 0.02),
      fontSize: 14,
      color: colorHelper.greyColor,
      fontWeight: FontWeight.bold,
      text: stringHelper.name,
    );
  }

  Widget nameFieldWidget(double height, double width) {
    return const TextFieldWidget(
      obscureText: false,
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
    );
  }

  Widget userNameWidget(double height, double width) {
    return TextWidget(
      textAlign: TextAlign.start,
      width: double.infinity,
      fontFamily: stringHelper.nunito,
      margin: EdgeInsets.only(top: height * 0.02),
      fontSize: 14,
      color: colorHelper.greyColor,
      fontWeight: FontWeight.bold,
      text: stringHelper.userName,
    );
  }

  Widget userNameFieldWidget(double height, double width) {
    return TextFieldIcon(
      image: stringHelper.verifyIcon,
      text: stringHelper.verifyText,
      margin: const EdgeInsets.only(left: 10),
      width: 13,
      height: 13,
      boxBorder: Border(bottom: BorderSide(width: 1)),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.name,
      isDense: true,
    );
  }

  Widget emailTextWidget(double height, double width) {
    return TextWidget(
      textAlign: TextAlign.start,
      width: double.infinity,
      fontFamily: stringHelper.nunito,
      margin: EdgeInsets.only(top: height * 0.02),
      fontSize: 14,
      color: colorHelper.greyColor,
      fontWeight: FontWeight.bold,
      text: stringHelper.email,
    );
  }

  Widget emailTextFieldWidget(double height, double width) {
    return TextFieldIcon(
      image: stringHelper.verifyIcon,
      text: stringHelper.verifyText,
      margin: const EdgeInsets.only(left: 10),
      width: 13,
      boxBorder: Border(bottom: BorderSide(width: 1)),
      height: 13,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      isDense: true,
    );
  }

  Widget phoneTextWidget(double height, double width) {
    return TextWidget(
      textAlign: TextAlign.start,
      width: double.infinity,
      fontFamily: stringHelper.nunito,
      margin: EdgeInsets.only(top: height * 0.02),
      fontSize: 14,
      color: colorHelper.greyColor,
      fontWeight: FontWeight.bold,
      text: stringHelper.phone,
    );
  }

  Widget phoneTextFieldWidget(double height, double width) {
    return TextFieldIcon(
      image: stringHelper.verifyIcon,
      text: stringHelper.verifyText,
      margin: const EdgeInsets.only(left: 10),
      width: 13,
      height: 13,
      boxBorder: Border(bottom: BorderSide(width: 1)),
      inputFormatters: [LengthLimitingTextInputFormatter(10)],
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      isDense: true,
    );
  }

  Widget countryTextWidget(double height, double width) {
    return TextWidget(
      textAlign: TextAlign.start,
      width: double.infinity,
      fontFamily: stringHelper.nunito,
      margin: EdgeInsets.only(top: height * 0.02),
      fontSize: 14,
      color: colorHelper.greyColor,
      fontWeight: FontWeight.bold,
      text: stringHelper.country,
    );
  }

  Widget countryTextFieldWidget(double height, double width) {
    return TextFieldWidget(
      fontWeight: FontWeight.normal,
      fontFamily: stringHelper.nunito,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      obscureText: false,
      borderColor: colorHelper.textColor,
      textColor: colorHelper.textColor,
    );
  }

  Widget communityTextWidget(double height, double width) {
    return TextWidget(
      textAlign: TextAlign.start,
      width: double.infinity,
      fontFamily: stringHelper.nunito,
      margin: EdgeInsets.only(top: height * 0.02),
      fontSize: 14,
      color: colorHelper.greyColor,
      fontWeight: FontWeight.bold,
      text: stringHelper.community,
    );
  }

  Widget communityTextFieldWidget(double height, double width) {
    return TextFieldWidget(
      fontWeight: FontWeight.normal,
      fontFamily: stringHelper.nunito,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      obscureText: false,
      borderColor: colorHelper.textColor,
      textColor: colorHelper.textColor,
    );
  }

  Widget interestTextWidget(double height, double width) {
    return Row(
      children: [
        Expanded(
          child: TextWidget(
            textAlign: TextAlign.start,
            // width: double.infinity,
            fontFamily: stringHelper.nunito,
            margin: EdgeInsets.only(top: height * 0.02),
            fontSize: 14,
            color: colorHelper.greyColor,
            fontWeight: FontWeight.bold,
            text: stringHelper.interest,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: height * 0.02),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: colorHelper.iconBgColor,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Row(
            children: [
              Icon(
                Icons.add,
                size: 20,
                color: colorHelper.iconColor,
              ),
              TextWidget(
                margin: const EdgeInsets.only(left: 8),
                text: "ADD",
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget interestTextFieldWidget(double height, double width) {
    return TextFieldWidget(
      fontWeight: FontWeight.normal,
      fontFamily: stringHelper.nunito,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      obscureText: false,
      borderColor: colorHelper.textColor,
      textColor: colorHelper.textColor,
    );
  }

  Widget bioTextWidget(double height, double width) {
    return TextWidget(
      textAlign: TextAlign.start,
      width: double.infinity,
      fontFamily: stringHelper.nunito,
      margin: EdgeInsets.only(top: height * 0.02),
      fontSize: 14,
      color: colorHelper.greyColor,
      fontWeight: FontWeight.bold,
      text: stringHelper.bio,
    );
  }

  Widget bioTextFieldWidget(double height, double width) {
    return Container(
        height: 108,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: colorHelper.containerColor,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: TextFormField(
          autocorrect: false,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          maxLines: 5,
          decoration: const InputDecoration(
            isDense: true,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
          ),
          style: TextStyle(
            decoration: TextDecoration.none,
            fontWeight: FontWeight.normal,
            fontFamily: stringHelper.nunito,
            fontSize: 14,
            color: colorHelper.textColor,
          ),
        ));
  }

  Widget hobbiesTextWidget(double height, double width) {
    return Row(
      children: [
        Expanded(
          child: TextWidget(
            textAlign: TextAlign.start,
            // width: double.infinity,
            fontFamily: stringHelper.nunito,
            margin: EdgeInsets.only(top: height * 0.02),
            fontSize: 14,
            color: colorHelper.greyColor,
            fontWeight: FontWeight.bold,
            text: stringHelper.hobbies,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: height * 0.02),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: colorHelper.iconBgColor,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Row(
            children: [
              Icon(
                Icons.add,
                size: 20,
                color: colorHelper.iconColor,
              ),
              TextWidget(
                margin: const EdgeInsets.only(left: 8),
                text: "ADD",
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget hobbiesTextFieldWidget(double height, double width) {
    return TextFieldWidget(
      fontWeight: FontWeight.normal,
      fontFamily: stringHelper.nunito,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      obscureText: false,
      borderColor: colorHelper.textColor,
      textColor: colorHelper.textColor,
    );
  }

  Widget saveBtn(double height, double width, BuildContext context) {
    return ButtonWidget(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      text: stringHelper.save,
      margin: EdgeInsets.only(top: height * 0.05),
      height: height * 0.08,
      color: colorHelper.whiteColor,
      fontWeight: FontWeight.w500,
      fontFamily: stringHelper.montserratSemibold,
      fontSize: 17,
    );
  }
}

import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loginsignup/controller/signup_controller.dart';
import 'package:loginsignup/ui/radiobutton.dart';
import 'package:loginsignup/widgets/button_widget.dart';
import 'package:loginsignup/widgets/text_widgets.dart';
import 'package:loginsignup/widgets/textfield_widget.dart';

import '../helper/string_helper.dart';

class SignUpPage extends StatelessWidget {
  final StringHelper stringHelper = StringHelper.getInstance;

  final SignUpController signUpController = Get.put(SignUpController());

  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var height = screenSize.height;
    var width = screenSize.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: height * 0.1,
              ),
              child: Center(
                child: Image.asset(
                  stringHelper.imageLogo,
                  height: 99,
                  width: 99,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: height * 0.01),
              child: TextWidget(
                  text: stringHelper.createAccountText,
                  fontFamily: stringHelper.tiemposSemibold,
                  color: const Color(0xFF222C82),
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
            Container(
              margin: EdgeInsets.only(top: height * 0.01),
              child: TextWidget(
                  text: stringHelper.signUpStartedText,
                  fontFamily: stringHelper.nunito,
                  color: const Color(0xFF75777D),
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
            Container(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 35),
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextWidget(
                    fontFamily: stringHelper.nunito,
                    fontSize: 13,
                    color: const Color(0xFF75777D),
                    fontWeight: FontWeight.bold,
                    text: stringHelper.name,
                  ),
                  TextFieldWidget(
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    borderColor: const Color(0xFF424752),
                    textColor: const Color(0xFF424752),
                    controller: signUpController.nameController,
                  ),
                  TextWidget(
                    margin: EdgeInsets.only(top: height * 0.03),
                    fontFamily: stringHelper.nunito,
                    fontSize: 13,
                    color: const Color(0xFF75777D),
                    fontWeight: FontWeight.bold,
                    text: stringHelper.email,
                  ),
                  TextFieldWidget(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    borderColor: const Color(0xFF424752),
                    textColor: const Color(0xFF424752),
                    controller: signUpController.emailController,
                  ),
                  TextWidget(
                    margin: EdgeInsets.only(top: height * 0.03),
                    fontFamily: stringHelper.nunito,
                    fontSize: 13,
                    color: const Color(0xFF75777D),
                    fontWeight: FontWeight.bold,
                    text: stringHelper.phone,
                  ),
                  TextFieldWidget(
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    borderColor: const Color(0xFF424752),
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    textColor: const Color(0xFF424752),
                    controller: signUpController.phoneController,
                  ),
                  TextWidget(
                      margin: EdgeInsets.only(top: height * 0.03),
                      fontFamily: stringHelper.nunito,
                      fontSize: 13,
                      color: const Color(0xFF75777D),
                      fontWeight: FontWeight.bold,
                      text: stringHelper.userName),
                  TextFieldWidget(
                    fontFamily: stringHelper.nunito,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    borderColor: const Color(0xFF424752),
                    textColor: const Color(0xFF424752),
                    controller: signUpController.usrNameController,
                  ),
                  TextWidget(
                      margin: EdgeInsets.only(top: height * 0.03),
                      fontFamily: stringHelper.nunito,
                      fontSize: 13,
                      color: const Color(0xFF75777D),
                      fontWeight: FontWeight.bold,
                      text: stringHelper.age),
                  TextFieldWidget(
                    fontWeight: FontWeight.normal,
                    fontFamily: stringHelper.nunito,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    inputFormatters: [LengthLimitingTextInputFormatter(2)],
                    borderColor: const Color(0xFF424752),
                    textColor: const Color(0xFF424752),
                    controller: signUpController.ageController,
                  ),
                  TextWidget(
                      margin: EdgeInsets.only(top: height * 0.03),
                      fontFamily: stringHelper.nunito,
                      fontSize: 13,
                      color: const Color(0xFF75777D),
                      fontWeight: FontWeight.bold,
                      text: stringHelper.gender),
                  SizedBox(height: height * 0.11, child: RadioBtnWidget()),
                  TextWidget(
                      margin: EdgeInsets.only(top: height * 0.03),
                      fontFamily: stringHelper.nunito,
                      fontSize: 13,
                      color: const Color(0xFF75777D),
                      fontWeight: FontWeight.bold,
                      text: stringHelper.password),
                  Obx(() => (TextFieldWidget(
                        fontWeight: FontWeight.normal,
                        fontFamily: stringHelper.nunito,
                        controller: signUpController.passController,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        obscureText: signUpController.visiblePassword.value,
                        suffixIcon: IconButton(
                          icon: Icon(signUpController.visiblePassword.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            signUpController.visiblePassword.value =
                                !signUpController.visiblePassword.value;
                          },
                        ),
                        borderColor: const Color(0xFF424752),
                        textColor: const Color(0xFF424752),
                      ))),
                  TextWidget(
                      margin: EdgeInsets.only(top: height * 0.03),
                      fontFamily: stringHelper.nunito,
                      fontSize: 13,
                      color: const Color(0xFF75777D),
                      fontWeight: FontWeight.bold,
                      text: stringHelper.confirmPassword),
                  Obx(() => (TextFieldWidget(
                        fontWeight: FontWeight.normal,
                        fontFamily: stringHelper.nunito,
                        controller: signUpController.confPassController,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        obscureText: signUpController.visibleConfPassword.value,
                        suffixIcon: IconButton(
                          icon: Icon(signUpController.visibleConfPassword.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () {
                            signUpController.visibleConfPassword.value =
                                !signUpController.visibleConfPassword.value;
                          },
                        ),
                        borderColor: const Color(0xFF424752),
                        textColor: const Color(0xFF424752),
                      ))),
                  TextWidget(
                      margin: EdgeInsets.only(top: height * 0.03),
                      fontFamily: stringHelper.nunito,
                      fontSize: 13,
                      color: const Color(0xFF75777D),
                      fontWeight: FontWeight.bold,
                      text: stringHelper.country),
                  // SizedBox(
                  //     width: double.infinity,
                  //     child: ListTile(
                  //       title: Text("India"),
                  //       trailing: GestureDetector(
                  //           onTap: () {
                  //             print("country picker");
                  //             CountryListPick(
                  //               useUiOverlay: true,
                  //               theme: CountryTheme(
                  //                 isShowFlag: false,
                  //                 isShowTitle: true,
                  //                 isShowCode: false,
                  //                 isDownIcon: true,
                  //                 showEnglishName: false,
                  //                 labelColor: Color(0xFF75777D),
                  //               ),
                  //               onChanged: (CountryCode? code) {
                  //                 print(code!.name);
                  //               },
                  //               initialSelection: 'US',
                  //             );
                  //           },
                  //           child: Icon(Icons.keyboard_arrow_down)),
                  //     )),
                  Container(
                    width: width,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CountryListPick(
                          useUiOverlay: true,
                          theme: CountryTheme(
                            isShowFlag: false,
                            isShowTitle: true,
                            isShowCode: false,
                            isDownIcon: false,
                            showEnglishName: false,
                            labelColor: const Color(0xFF424752),
                          ),
                          onChanged: (CountryCode? code) {
                            print(code!.name);
                            signUpController.country.value = code.name!;
                            print(
                                "signUpController.country.value==${signUpController.country.value}");
                          },
                          initialSelection: 'US',
                        ),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          size: 22,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                  TextWidget(
                      margin: EdgeInsets.only(top: height * 0.03),
                      fontFamily: stringHelper.nunito,
                      fontSize: 13,
                      color: const Color(0xFF75777D),
                      fontWeight: FontWeight.bold,
                      text: stringHelper.subLocation),
                  TextFieldWidget(
                    fontWeight: FontWeight.normal,
                    fontFamily: stringHelper.nunito,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    controller: signUpController.locationController,
                    obscureText: false,
                    borderColor: const Color(0xFF424752),
                    textColor: const Color(0xFF424752),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height * 0.02),
                    child: Row(
                      children: [
                        Obx(() => Checkbox(
                            value: signUpController.check.value,
                            onChanged: (value) {
                              signUpController.check.value = value!;
                              print("check value==$value}");
                            })),
                        RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: stringHelper.accept,
                                style:
                                    const TextStyle(color: Color(0xFF424752))),
                            TextSpan(
                                text: stringHelper.termsConditions,
                                style: const TextStyle(
                                    color: Color(0xFF222C82),
                                    decoration: TextDecoration.underline,
                                    decorationColor: Color(0xFF222C82),
                                    decorationThickness: 2)),
                            TextSpan(
                                text: stringHelper.ofTheApp,
                                style:
                                    const TextStyle(color: Color(0xFF424752))),
                          ]),
                        ),
                      ],
                    ),
                  ),
                  ButtonWidget(
                    onTap: () {
                      signUpController.signUp();
                    },
                    height: height * 0.075,
                    width: MediaQuery.of(context).size.width,
                    color: const Color(0xFFFFFFFF),
                    fontSize: 17,
                    fontFamily: stringHelper.nunito,
                    fontWeight: FontWeight.w500,
                    margin: EdgeInsets.only(top: height * 0.05),
                    text: stringHelper.signUp,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: height * 0.06),
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: stringHelper.haveAccount,
                            style: const TextStyle(color: Color(0xFF424752))),
                        TextSpan(
                            text: stringHelper.signIn,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => signUpController.login(),
                            style: const TextStyle(
                                color: Color(0xFFC5A12E),
                                decoration: TextDecoration.underline,
                                decorationThickness: 2,
                                decorationColor: Color(0xFFC5A12E))),
                      ]),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

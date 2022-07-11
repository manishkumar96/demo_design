import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsignup/controller/login_controller.dart';
import 'package:loginsignup/helper/string_helper.dart';
import 'package:loginsignup/widgets/text_widgets.dart';

import '../widgets/button_widget.dart';
import '../widgets/textfield_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final StringHelper stringHelper = StringHelper.getInstance;
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var height = screenSize.height;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: height * 0.1),
            child: Center(
              child: Image.asset(
                stringHelper.imageLogo,
                height: 99,
                width: 99,
              ),
            ),
          ),
          TextWidget(
            margin: EdgeInsets.only(top: height * 0.01),
            text: stringHelper.welcomeBack,
            fontWeight: FontWeight.w500,
            fontFamily: stringHelper.tiemposSemibold,
            fontSize: 20,
            color: const Color(0xFF222C82),
          ),
          TextWidget(
            margin: EdgeInsets.only(top: height * 0.01),
            text: stringHelper.loginContinue,
            fontWeight: FontWeight.w500,
            fontFamily: stringHelper.nunito,
            fontSize: 20,
            color: const Color(0xFF75777D),
          ),
          Container(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                  controller: loginController.emailController,
                ),
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
                      controller: loginController.passController,
                      maxLines: 1,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.next,
                      obscureText: loginController.visiblePassword.value,
                      suffixIcon: IconButton(
                        icon: Icon(loginController.visiblePassword.value
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          loginController.visiblePassword.value =
                              !loginController.visiblePassword.value;
                        },
                      ),
                      borderColor: const Color(0xFF424752),
                      textColor: const Color(0xFF424752),
                    ))),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                      loginController.forgotPassword();
                    },
                    child: TextWidget(
                      margin: EdgeInsets.only(top: height * 0.05),
                      text: stringHelper.forgotPassword,
                      color: const Color(0xFFC5A12E),
                    ),
                  ),
                ),
                ButtonWidget(
                  onTap: () {
                    loginController.signIn();
                  },
                  height: height * 0.075,
                  width: MediaQuery.of(context).size.width,
                  color: const Color(0xFFFFFFFF),
                  fontSize: 17,
                  fontFamily: stringHelper.nunito,
                  fontWeight: FontWeight.w500,
                  margin: EdgeInsets.only(top: height * 0.05),
                  text: stringHelper.signIn,
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.06),
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(children: <TextSpan>[
                      TextSpan(
                          text: stringHelper.newToApp,
                          style: const TextStyle(color: Color(0xFF424752))),
                      TextSpan(
                          text: stringHelper.signUp,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => loginController.signUp(),
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
          ),
        ]),
      ),
    ));
  }
}

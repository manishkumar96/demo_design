import 'package:flutter/material.dart';
import 'package:loginsignup/widgets/image_widget.dart';
import 'package:loginsignup/widgets/text_widgets.dart';
import 'package:loginsignup/widgets/texticon_widget.dart';

import '../helper/color_helper.dart';
import '../helper/string_helper.dart';

class MenuPage extends StatelessWidget {
  MenuPage({Key? key}) : super(key: key);

  final StringHelper stringHelper = StringHelper.getInstance;
  final ColorHelper colorHelper = ColorHelper.getInstance;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var height = screenSize.height;
    var width = screenSize.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: colorHelper.bgColor,
      appBar: appBarWidget(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 20, left: 24, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              userDetailWidget(height, width),
              Container(
                margin: const EdgeInsets.only(top: 10),
                child: Divider(
                  thickness: 1,
                  color: Colors.grey.shade300,
                ),
              ),
              createInviteWidget(height, width),
              aboutWidget(height, width),
              dividerWidget(height),
              settingsWidget(height, width),
              dividerWidget(height),
              termsConditions(height, width),
              dividerWidget(height),
              notificationWidget(height, width),
              dividerWidget(height),
              contactUs(height, width),
              dividerWidget(height),
              faqWidget(height),
              dividerWidget(height),
              logoutWidget(height),
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
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ImageWidget(name: stringHelper.imageLogo),
      ),
      title: TextWidget(
        text: stringHelper.menuText,
        color: colorHelper.textColor,
        fontSize: 17,
        fontFamily: stringHelper.andadaPro,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
    );
  }

  Widget userDetailWidget(double height, double width) {
    return Row(
      children: [
        Container(
          height: 66,
          width: 66,
          decoration: BoxDecoration(
            border: Border.all(width: 4, color: colorHelper.yellowColor),
            image: DecorationImage(
                image: AssetImage(stringHelper.image), fit: BoxFit.fill),
            borderRadius: const BorderRadius.all(
              Radius.circular(50),
            ),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                margin: const EdgeInsets.only(left: 12),
                text: "sjdjasbd",
                fontWeight: FontWeight.bold,
                fontFamily: stringHelper.nunito,
                fontSize: 17,
              ),
              TextWidget(
                margin: const EdgeInsets.only(left: 12),
                text: "sjdjasbd",
                fontWeight: FontWeight.bold,
                fontFamily: stringHelper.nunito,
                fontSize: 17,
              ),
            ],
          ),
        ),
        ImageWidget(
          name: stringHelper.editIcon,
          height: 20,
          width: 20,
        ),
      ],
    );
  }

  Widget createInviteWidget(double height, double width) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextIconWidget(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            containerColor: colorHelper.whiteColor,
            name: stringHelper.groupIcon,
            text: stringHelper.createGroup,
            imageWidth: 40,
            imageHeight: 40,
            containerHeight: height * 0.08,
            containerWidth: height * 0.21,
            color: colorHelper.textColor2,
            padding: const EdgeInsets.all(10),
          ),
          Container(
            margin: EdgeInsets.all(width * 0.02),
          ),
          TextIconWidget(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            containerColor: colorHelper.whiteColor,
            name: stringHelper.inviteFriendsIcon,
            text: stringHelper.inviteFriends,
            imageWidth: 36,
            imageHeight: 35,
            containerHeight: height * 0.08,
            containerWidth: height * 0.21,
            color: colorHelper.textColor2,
            padding: const EdgeInsets.all(10),
          ),
        ],
      ),
    );
  }

  Widget aboutWidget(double height, double width) {
    return TextWidget(
      margin: EdgeInsets.only(top: height * 0.06),
      text: stringHelper.aboutUs,
      fontSize: 17,
      fontFamily: stringHelper.nunito,
      fontWeight: FontWeight.w500,
      color: colorHelper.textColor2,
    );
  }

  Widget settingsWidget(double height, double width) {
    return TextWidget(
      margin: EdgeInsets.only(top: height * 0.02),
      text: stringHelper.settings,
      fontSize: 17,
      fontFamily: stringHelper.nunito,
      fontWeight: FontWeight.w500,
      color: colorHelper.textColor2,
    );
  }

  Widget dividerWidget(double height) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.005),
      child: Divider(
        thickness: 1,
        color: Colors.grey.shade300,
      ),
    );
  }

  Widget termsConditions(double height, double width) {
    return TextWidget(
      margin: EdgeInsets.only(top: height * 0.02),
      text: stringHelper.termsAndConditions,
      fontSize: 17,
      fontFamily: stringHelper.nunito,
      fontWeight: FontWeight.w500,
      color: colorHelper.textColor2,
    );
  }

  Widget notificationWidget(double height, double width) {
    return TextWidget(
      margin: EdgeInsets.only(top: height * 0.02),
      text: stringHelper.notification,
      fontSize: 17,
      fontFamily: stringHelper.nunito,
      fontWeight: FontWeight.w500,
      color: colorHelper.textColor2,
    );
  }

  Widget contactUs(double height, double width) {
    return TextWidget(
      margin: EdgeInsets.only(top: height * 0.02),
      text: stringHelper.contactUs,
      fontSize: 17,
      fontFamily: stringHelper.nunito,
      fontWeight: FontWeight.w500,
      color: colorHelper.textColor2,
    );
  }

  Widget faqWidget(double height) {
    return TextWidget(
      margin: EdgeInsets.only(top: height * 0.02),
      text: stringHelper.faq,
      fontSize: 17,
      fontFamily: stringHelper.nunito,
      fontWeight: FontWeight.w500,
      color: colorHelper.textColor2,
    );
  }

  Widget logoutWidget(double height) {
    return TextWidget(
      margin: EdgeInsets.only(top: height * 0.02, bottom: height * 0.05),
      text: stringHelper.logout,
      fontSize: 17,
      fontFamily: stringHelper.nunito,
      fontWeight: FontWeight.w500,
      color: colorHelper.textColor2,
    );
  }
}

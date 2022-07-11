import 'package:flutter/material.dart';
import 'package:loginsignup/widgets/button_widget.dart';
import 'package:loginsignup/widgets/image_widget.dart';
import 'package:loginsignup/widgets/userrequest_widget.dart';

import '../helper/color_helper.dart';
import '../helper/string_helper.dart';
import '../widgets/text_widgets.dart';

class RespondScreen extends StatelessWidget {
  RespondScreen({Key? key}) : super(key: key);

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
      body: Column(
        children: [
          friendListWidget(),
          seeAllBtn(height, width, context),
        ],
      ),
    ));
  }

  PreferredSizeWidget appBarWidget() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ImageWidget(name: stringHelper.imageLogo),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: TextWidget(
        text: stringHelper.friendsRequest,
        color: colorHelper.textColor,
        fontSize: 17,
        fontFamily: stringHelper.andadaPro,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget friendListWidget() {
    return Expanded(
      child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return UserRequestWidget();
          }),
    );
  }

  Widget seeAllBtn(double height, double width, BuildContext context) {
    return ButtonWidget(
      onTap: () {},
      height: height * 0.075,
      width: MediaQuery.of(context).size.width,
      color: const Color(0xFFFFFFFF),
      fontSize: 17,
      fontFamily: stringHelper.nunito,
      fontWeight: FontWeight.w500,
      margin: EdgeInsets.only(top: height * 0.05),
      text: stringHelper.seeAll,
    );
  }
}

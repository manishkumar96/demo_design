import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsignup/helper/color_helper.dart';
import 'package:loginsignup/helper/string_helper.dart';
import 'package:loginsignup/widgets/text_widgets.dart';

import '../widgets/image_widget.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
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
        body: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    backgroundImageWidget(height, width),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: cameraWidget(height, width),
                    ),
                    Stack(
                      children: [
                        Center(
                          child: SizedBox(
                            width: height * 0.12,
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                userImageWidget(height, width),
                                cameraImageWidget(height, width),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget appBarWidget() {
    return AppBar(
      title: TextWidget(
        text: stringHelper.profile,
        color: colorHelper.textColor,
        fontFamily: stringHelper.andadaPro,
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            stringHelper.editIcon,
            height: 16,
            width: 16,
          ),
        ),
      ],
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

  Widget backgroundImageWidget(double height, double width) {
    return Container(
      height: height * 0.25,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(stringHelper.image), fit: BoxFit.cover),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }

  Widget cameraWidget(double height, double width) {
    return ImageWidget(
      name: stringHelper.camera,
      height: height * 0.07,
      width: height * 0.07,
      color: colorHelper.blueColor,
      padding: const EdgeInsets.all(12),
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
    return ImageWidget(
      name: stringHelper.camera,
      height: height * 0.04,
      width: height * 0.04,
      color: colorHelper.blueColor,
      padding: const EdgeInsets.all(10),
    );
  }
}

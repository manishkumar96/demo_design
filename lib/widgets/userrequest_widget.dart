import 'package:flutter/material.dart';
import 'package:loginsignup/widgets/button_widget.dart';
import 'package:loginsignup/widgets/image_widget.dart';
import 'package:loginsignup/widgets/text_widgets.dart';

import '../helper/color_helper.dart';
import '../helper/string_helper.dart';

class UserRequestWidget extends StatelessWidget {
  UserRequestWidget({Key? key}) : super(key: key);
  final StringHelper stringHelper = StringHelper.getInstance;
  final ColorHelper colorHelper = ColorHelper.getInstance;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var height = screenSize.height;
    var width = screenSize.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageWidget(
            name: stringHelper.imageLogo,
            height: 44,
            width: 44,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "leslie Alexander"
                        " 95 friends request to you.",
                    color: colorHelper.textColor,
                    fontFamily: stringHelper.andadaPro,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                  TextWidget(
                    text: "today",
                    color: colorHelper.textColor4,
                    fontFamily: stringHelper.nunito,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ],
              ),
            ),
          ),
          ButtonWidget(
            height: height * 0.04,
            width: width * 0.17,
            text: stringHelper.accept,
            containerColor: colorHelper.yellowColor,
          ),
          Container(
            margin: EdgeInsets.all(width * 0.02),
          ),
          ButtonWidget(
            width: width * 0.17,
            height: height * 0.04,
            text: stringHelper.decline,
            containerColor: colorHelper.whiteColor,
            border: Border.all(color: colorHelper.textColor),
          ),
        ],
      ),
    );
  }
}

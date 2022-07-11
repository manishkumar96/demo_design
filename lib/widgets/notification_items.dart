import 'package:flutter/material.dart';
import 'package:loginsignup/widgets/text_widgets.dart';

import '../helper/color_helper.dart';
import '../helper/string_helper.dart';
import 'image_widget.dart';

class NotificationItem extends StatelessWidget {
  final int? index;
  NotificationItem({Key? key, this.index}) : super(key: key);
  final StringHelper stringHelper = StringHelper.getInstance;
  final ColorHelper colorHelper = ColorHelper.getInstance;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var height = screenSize.height;
    var width = screenSize.width;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1.0, color: Colors.grey.shade300),
        ),
      ),
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ImageWidget(
            name: stringHelper.imageLogo,
            height: 44,
            width: 44,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  margin: const EdgeInsets.only(left: 20),
                  text: "Nice Book handful of model sentence model sentence",
                  color: colorHelper.textColor,
                  fontFamily: stringHelper.nunito,
                  fontSize: 14,
                ),
                TextWidget(
                  text: "today",
                  color: colorHelper.textColor4,
                  margin: const EdgeInsets.only(left: 20),
                  fontFamily: stringHelper.nunito,
                  fontSize: 14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

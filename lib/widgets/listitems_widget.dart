import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loginsignup/controller/homepage_controller.dart';
import 'package:loginsignup/widgets/image_widget.dart';

import '../helper/color_helper.dart';
import '../helper/string_helper.dart';

class ListItemsWidget extends StatelessWidget {
  ListItemsWidget({
    Key? key,
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.textName,
    this.textTime,
    this.textDesc,
    this.index,
  }) : super(key: key);
  final StringHelper stringHelper = StringHelper.getInstance;
  final ColorHelper colorHelper = ColorHelper.getInstance;
  final String? textName, textTime, textDesc;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final int? index;
  final HomePageController homePageController = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageWidget(
              name: stringHelper.imageLogo,
              height: 44,
              width: 44,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "sfgsf",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: stringHelper.nunito,
                        fontWeight: FontWeight.bold,
                        color: colorHelper.textColor2,
                      ),
                    ),
                    Text(
                      "sdfgvsdffv",
                      style: TextStyle(
                          fontSize: 11,
                          fontFamily: stringHelper.nunito,
                          fontWeight: FontWeight.w500,
                          color: colorHelper.textColor2),
                    ),
                    Text(
                      "rtgrtgrfhyaefrefrfvbheffhnfdhfbedfhufbrwefrhjwebfwebfweujwegfewjwebbjfghfghhhdfhgjhfdhgjhfjddhfyjhdfhfgjhfgjkmdfghgcxhjngbjmhfjhfjhfjkghfcgjh",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: stringHelper.nunito,
                        fontWeight: FontWeight.normal,
                        color: colorHelper.textColor3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Image.asset(
                stringHelper.threeDots,
                height: 16,
                width: 4,
              ),
            ),
          ],
        ),
        ImageWidget(
          name: stringHelper.image,
          fit: BoxFit.fill,
          padding: const EdgeInsets.all(5),
          height: 210,
        ),
        Container(
          margin: EdgeInsets.only(top: 20, left: 20),
          child: Row(
            children: [
              Obx(
                () => homePageController.like[index!] == false
                    ? GestureDetector(
                        onTap: () {
                          homePageController.like[index!].value = true;
                        },
                        child: Image.asset(
                          stringHelper.likeBorderIcon,
                          height: 18,
                          width: 20,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          homePageController.like[index!].value = false;
                        },
                        child: Image.asset(
                          stringHelper.likeRedColorIcon,
                          height: 18,
                          width: 20,
                        ),
                      ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "7.8k",
                  style: TextStyle(
                      fontSize: 15,
                      color: colorHelper.textColor2,
                      fontWeight: FontWeight.w500,
                      fontFamily: stringHelper.nunito),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 26),
                child: Image.asset(
                  stringHelper.commentIcon,
                  height: 18,
                  width: 20,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "288",
                  style: TextStyle(
                    fontFamily: stringHelper.nunito,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: colorHelper.textColor2,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(
                    stringHelper.shareIcon,
                    height: 18,
                    width: 18,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 16),
          child: Divider(
            thickness: 1,
          ),
        )
      ],
    );
  }
}

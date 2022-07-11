import 'package:flutter/material.dart';
import 'package:loginsignup/helper/color_helper.dart';
import 'package:loginsignup/helper/string_helper.dart';
import 'package:loginsignup/widgets/image_widget.dart';
import 'package:loginsignup/widgets/text_widgets.dart';

class ListViewItems extends StatelessWidget {
  ListViewItems({Key? key}) : super(key: key);

  final StringHelper stringHelper = StringHelper.getInstance;
  final ColorHelper colorHelper = ColorHelper.getInstance;

  // final VideoController videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              text: stringHelper.flimVideos,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: stringHelper.nunito,
              color: colorHelper.textColor2,
            ),
            TextWidget(
              text: stringHelper.seeAll,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              fontFamily: stringHelper.nunito,
              color: colorHelper.blueColor,
            ),
          ],
        ),
        TextWidget(
          text: stringHelper.similarTopic,
          fontFamily: stringHelper.nunito,
          fontWeight: FontWeight.w500,
          fontSize: 13,
          color: colorHelper.textColor2,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.25,
          child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    // ImageWidget(
                    //   padding: EdgeInsets.all(6),
                    //   name: stringHelper.image,
                    //   height: MediaQuery.of(context).size.height * 0.25,
                    //   width: MediaQuery.of(context).size.width * 0.4,
                    //   fit: BoxFit.fill,
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(stringHelper.image),
                              fit: BoxFit.fill),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Center(
                        child: ImageWidget(
                      name: stringHelper.playBtnIcon,
                      height: 30,
                      width: 30,
                    )),
                  ],
                );
              }),
        )
      ],
    );
  }
}

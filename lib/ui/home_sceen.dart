import 'package:flutter/material.dart';
import 'package:loginsignup/helper/color_helper.dart';
import 'package:loginsignup/helper/string_helper.dart';
import 'package:loginsignup/widgets/image_widget.dart';

import '../widgets/listitems_widget.dart';
import '../widgets/listview_items.dart';
import '../widgets/textfieldIcon.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final StringHelper stringHelper = StringHelper.getInstance;
  final ColorHelper colorHelper = ColorHelper.getInstance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: colorHelper.blueColor,
        child: ImageWidget(
          name: stringHelper.addImageIcon,
          height: 24,
          width: 24,
        ),
      ),
      appBar: appBarWidget(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFieldIcon(
                hintText: stringHelper.search,
                text: "",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.search,
                boxBorder: Border.all(width: 1),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                image: stringHelper.searchIcon,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                height: 18,
                width: 18,
                isDense: true,
                padding: const EdgeInsets.only(
                  left: 28,
                  top: 9,
                  right: 21,
                  bottom: 10,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 5,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return index == 3
                          ? ListViewItems()
                          : Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ListItemsWidget(index: index),
                              ),
                            );
                    }),
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
      actions: [
        Row(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: ImageWidget(
                    margin: const EdgeInsets.only(right: 32),
                    name: stringHelper.notificationIcon,
                    height: 20,
                    width: 20,
                  ),
                ),
                ImageWidget(
                  margin: const EdgeInsets.only(right: 32),
                  name: stringHelper.circleNtificationIcon,
                  height: 10,
                  width: 10,
                ),
              ],
            ),
            ImageWidget(
              margin: const EdgeInsets.only(right: 20),
              name: stringHelper.imageLogo,
              height: 30,
              width: 30,
            )
          ],
        )
      ],
      leading: ImageWidget(
        padding: const EdgeInsets.all(8),
        name: stringHelper.imageLogo,
        height: 36,
        width: 36,
      ),
    );
  }
}

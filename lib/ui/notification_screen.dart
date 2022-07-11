import 'package:flutter/material.dart';
import 'package:loginsignup/widgets/notification_items.dart';

import '../helper/color_helper.dart';
import '../helper/string_helper.dart';
import '../widgets/image_widget.dart';
import '../widgets/text_widgets.dart';

class NotificationScreen extends StatelessWidget {
  NotificationScreen({Key? key}) : super(key: key);

  final StringHelper stringHelper = StringHelper.getInstance;
  final ColorHelper colorHelper = ColorHelper.getInstance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBarWidget(),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Dismissible(
                        key: UniqueKey(),
                        secondaryBackground: slideLeftBackground(),
                        background: Container(color: Colors.red),
                        direction: DismissDirection.endToStart,
                        onDismissed: (_) {},
                        child: NotificationItem(index: index));
                  }),
            )
          ],
        ),
      ),
    ));
  }

  PreferredSizeWidget appBarWidget() {
    return AppBar(
      elevation: 0,
      actions: [
        ImageWidget(
          name: stringHelper.imageLogo,
          margin: EdgeInsets.only(right: 8),
          height: 30,
          width: 30,
        )
      ],
      centerTitle: true,
      title: TextWidget(
        text: stringHelper.notification,
        color: colorHelper.textColor,
        fontSize: 17,
        fontFamily: stringHelper.andadaPro,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: Colors.transparent,
      leading: GestureDetector(
        onTap: () {
          // Get.back();
        },
        child: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      alignment: Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }
}

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loginsignup/widgets/image_widget.dart';
import 'package:loginsignup/widgets/text_widgets.dart';

import '../controller/createpost_controller.dart';
import '../helper/color_helper.dart';
import '../helper/string_helper.dart';

class CreatePostScreen extends StatelessWidget {
  CreatePostScreen({Key? key}) : super(key: key);
  final StringHelper stringHelper = StringHelper.getInstance;
  final ColorHelper colorHelper = ColorHelper.getInstance;

  final CreatePostController createPostController =
      Get.put(CreatePostController());

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var height = screenSize.height;
    var width = screenSize.width;
    return SafeArea(
      child: Scaffold(
        appBar: appBarWidget(),
        body: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Card(
                  elevation: 10,
                  margin: EdgeInsets.zero,
                  child: Container(
                    padding: EdgeInsets.only(left: 24, right: 20),
                    width: width,
                    height: 64,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextWidget(
                            text: stringHelper.addYourPost,
                            fontFamily: stringHelper.nunito,
                            fontSize: 15,
                            color: colorHelper.textColor5,
                          ),
                        ),
                        ImageWidget(
                          margin: EdgeInsets.only(right: 30),
                          name: stringHelper.videoCameraIcon,
                          height: 20,
                          width: 20,
                        ),
                        GestureDetector(
                          onTap: () {
                            createPostController.getImage();
                          },
                          child: ImageWidget(
                            name: stringHelper.imageIcon,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: height,
                width: width,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    nameWidget(height, width),
                    textFieldWidget(height, width),
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        imageWidget(height, width),
                        // Container(
                        //     height: height * 0.277 / 2,
                        //     width: width,
                        //     margin: EdgeInsets.symmetric(
                        //         horizontal: width * 0.001,
                        //         vertical: height * 0.005),
                        //     child: ),

                        countTextWidget(height, width),
                        // Container(
                        //     width: width / 5,
                        //     height: height * 0.1,
                        //     margin: EdgeInsets.only(
                        //         right: width * 0.05, bottom: height * 0.02),
                        //     decoration: BoxDecoration(color: Colors.grey.shade50),
                        //     child: countTextWidget(height, width)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget appBarWidget() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      title: TextWidget(
        text: stringHelper.createPost,
        color: colorHelper.textColor,
        fontFamily: stringHelper.andadaPro,
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
      leading: const Icon(
        Icons.close,
        color: Colors.black,
      ),
      actions: [
        Align(
          alignment: Alignment.center,
          child: TextWidget(
            text: stringHelper.post,
            color: colorHelper.blueColor,
            fontWeight: FontWeight.bold,
            fontFamily: stringHelper.nunito,
            fontSize: 15,
            margin: const EdgeInsets.all(20),
          ),
        ),
      ],
    );
  }

  Widget nameWidget(double height, double width) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.07),
      child: Row(
        children: [
          ImageWidget(
            name: stringHelper.imageLogo,
            height: 66,
            width: 66,
          ),
          TextWidget(
            margin: EdgeInsets.only(left: 12),
            text: stringHelper.name,
            fontWeight: FontWeight.bold,
            fontFamily: stringHelper.nunito,
            color: colorHelper.textColor2,
            fontSize: 17,
          )
        ],
      ),
    );
  }

  Widget textFieldWidget(double height, double width) {
    return Container(
      margin: EdgeInsets.only(top: height * 0.04),
      child: TextFormField(
        style: TextStyle(
          fontSize: 13,
          fontFamily: stringHelper.nunito,
        ),
        decoration: InputDecoration(
          isDense: true,
          suffixIcon: const Icon(Icons.keyboard),
          hintText: stringHelper.saySomething,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
        ),
      ),
    );
  }

  // Widget imageWidget(double height, double width) {
  //   return SizedBox(
  //     height: height * 0.3,
  //     child: Row(
  //       children: [
  //         GetBuilder<CreatePostController>(
  //             init: CreatePostController(),
  //             builder: (_) {
  //               return createPostController.imageFileList.isEmpty
  //                   ? SizedBox(
  //                       height: height,
  //                       width: width / 2.3,
  //                       child: ImageWidget(
  //                         fit: BoxFit.cover,
  //                         name: stringHelper.image,
  //                         margin: EdgeInsets.symmetric(
  //                             horizontal: width * 0.001,
  //                             vertical: height * 0.005),
  //                       ))
  //                   : Container(
  //                       height: height,
  //                       width: width / 2.3,
  //                       margin: EdgeInsets.symmetric(
  //                           horizontal: width * 0.004,
  //                           vertical: height * 0.005),
  //                       child: Image.file(
  //                           File(createPostController.imageFileList[0].path
  //                               .toString()),
  //                           fit: BoxFit.fill),
  //                     );
  //             }),
  //         SizedBox(
  //           height: height * 0.3,
  //           width: width / 2.3,
  //           child: Column(
  //             children: [
  //               GetBuilder(
  //                   init: CreatePostController(),
  //                   builder: (_) {
  //                     return (createPostController.imageFileList.length < 2)
  //                         ? ImageWidget(
  //                             height: height * 0.277 / 2,
  //                             name: stringHelper.image,
  //                             fit: BoxFit.fill,
  //                             margin: EdgeInsets.symmetric(
  //                                 horizontal: width * 0.001,
  //                                 vertical: height * 0.005),
  //                           )
  //                         : Container(
  //                             height: height * 0.277 / 2,
  //                             margin: EdgeInsets.symmetric(
  //                                 horizontal: width * 0.001,
  //                                 vertical: height * 0.005),
  //                             child: Image.file(
  //                                 File(createPostController
  //                                     .imageFileList[1].path
  //                                     .toString()),
  //                                 fit: BoxFit.fill),
  //                           );
  //                   }),
  //               GetBuilder(
  //                   init: CreatePostController(),
  //                   builder: (_) {
  //                     return (createPostController.imageFileList.length < 3)
  //                         ? ImageWidget(
  //                             height: height * 0.277 / 2,
  //                             fit: BoxFit.fill,
  //                             name: stringHelper.image,
  //                             margin: EdgeInsets.symmetric(
  //                                 horizontal: width * 0.001,
  //                                 vertical: height * 0.005),
  //                           )
  //                         : Container(
  //                             height: height * 0.277 / 2,
  //                             width: width,
  //                             margin: EdgeInsets.symmetric(
  //                                 horizontal: width * 0.001,
  //                                 vertical: height * 0.005),
  //                             child: Image.file(
  //                                 File(createPostController
  //                                     .imageFileList[2].path
  //                                     .toString()),
  //                                 fit: BoxFit.fill),
  //                           );
  //                   }),
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  Widget countTextWidget(double height, double width) {
    return Obx(
      () => createPostController.remaining.value < 3
          ? Container(
              height: height * 0.277 / 2,
              width: width,
              margin: EdgeInsets.symmetric(
                  horizontal: width * 0.001, vertical: height * 0.005),
              child: TextWidget(
                text: "",
              ))
          : BlurryContainer(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.001, vertical: height * 0.005),
              blur: 1,
              height: height * 0.277 / 2,
              elevation: 0,
              width: width / 2,
              color: Colors.transparent,
              child: Center(
                child: TextWidget(
                  textAlign: TextAlign.center,
                  text: "${createPostController.remaining.value.toString()}",
                  fontSize: 30,
                ),
              ),
            ),
    );
    //   Container(
    //   alignment: Alignment.center,
    //   child: Obx(
    //     () => createPostController.remaining.value < 3
    //         ? TextWidget(
    //             text: "",
    //           )
    //         : TextWidget(
    //             text: createPostController.remaining.value.toString(),
    //             fontSize: 15,
    //           ),
    //   ),
    // );
  }

  Widget imageWidget(double height, double width) {
    return Container();
  }
}

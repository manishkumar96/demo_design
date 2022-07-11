import 'package:get/get.dart';

import 'network_controller.dart';

class HomePageController extends GetxController {
  final NetworkController networkController = Get.put(NetworkController());

  List<RxBool> like = [false.obs, false.obs, false.obs, false.obs, false.obs];

  @override
  void onInit() {
    // print(
    //     "networkController.isOnline.value ${networkController.isOnline.value}");
    // if (networkController.isOnline.value == false) {
    //   print(
    //       "networkController.isOnline.value==${networkController.isOnline.value}");
    //   // Get.showSnackbar(
    //   //   const GetSnackBar(
    //   //     message: "Connection Lost",
    //   //     snackPosition: SnackPosition.TOP,
    //   //   ),
    //   // );
    // }
    // checkInternet();
    networkController.getConnectionType();
    super.onInit();
  }

  // checkInternet() {
  //   print(
  //       "networkController.isOnline.value ${networkController.isOnline.value}");
  //   if (networkController.isOnline.value == false) {
  //     print(
  //         "networkController.isOnline.value==${networkController.isOnline.value}");
  //   } else {
  //     print(
  //         "networkController.isOnline.value######${networkController.isOnline.value}");
  //   }
  // }
}

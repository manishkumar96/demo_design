import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  var connectionType = 0;
  late StreamSubscription streamSubscription;
  RxBool isOnline = false.obs;
  RxBool firstOpen = false.obs;

  @override
  void onInit() {
    getConnectionType();
    streamSubscription =
        Connectivity().onConnectivityChanged.listen(updateState);
    super.onInit();
  }

  Future<void> getConnectionType() async {
    ConnectivityResult? connectivityResult;
    try {
      connectivityResult = await (Connectivity().checkConnectivity());
    } on PlatformException catch (e) {
      print("Network exception===${e.message.toString()}");
    }
    return updateState(connectivityResult!);
  }

  Future<void> updateState(ConnectivityResult connectivityResult) async {
    if (connectivityResult == ConnectivityResult.none) {
      isOnline.value = false;
      print("Not connected to any network==${isOnline.value}");
      Get.showSnackbar(const GetSnackBar(
        message: "Check Internet",
        snackPosition: SnackPosition.TOP,
      ));
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // isOnline.value = true;
      // firstOpen.value = true;
      print("Connected to a wifi network==${isOnline.value}");
      Get.showSnackbar(const GetSnackBar(
        message: "Connected to a wi fi network",
        snackPosition: SnackPosition.TOP,
      ));
    } else if (connectivityResult == ConnectivityResult.mobile) {
      isOnline.value = true;
      Get.showSnackbar(const GetSnackBar(
        message: "Connected to a mobile network",
        snackPosition: SnackPosition.TOP,
      ));
      print("Connected to a mobile network==${isOnline.value}");
    }
    // if (firstOpen.value == true) {
    //   firstOpen.value = false;
    //   // isOnline.value = true;
    // } else if (firstOpen.value == false) {
    //   print("Connected to a wifi network==${isOnline.value}");
    //   Get.showSnackbar(const GetSnackBar(
    //     message: "Connected to a wi fi network",
    //     snackPosition: SnackPosition.TOP,
    //   ));
    // }
  }

  @override
  void onClose() {
    streamSubscription.cancel();
    super.onClose();
  }
}

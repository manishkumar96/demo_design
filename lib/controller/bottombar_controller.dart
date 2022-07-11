import 'package:get/get.dart';

class BottomBarScreenController extends GetxController {
  var selectedIndex = 2.obs;

  void onTabBarTap(var index) {
    selectedIndex.value = index;
    print("Selected Index $selectedIndex");
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsignup/controller/bottombar_controller.dart';
import 'package:loginsignup/controller/network_controller.dart';
import 'package:loginsignup/helper/color_helper.dart';
import 'package:loginsignup/helper/string_helper.dart';
import 'package:loginsignup/ui/chat_screen.dart';
import 'package:loginsignup/ui/home_sceen.dart';
import 'package:loginsignup/ui/menu_page.dart';
import 'package:loginsignup/ui/respond_screen.dart';
import 'package:loginsignup/ui/task_screen.dart';

class BottomBarScreen extends StatelessWidget {
  BottomBarScreen({Key? key}) : super(key: key);
  final StringHelper stringHelper = StringHelper.getInstance;
  final ColorHelper colorHelper = ColorHelper.getInstance;

  final BottomBarScreenController bottomBarScreenController =
      Get.put(BottomBarScreenController());

  final NetworkController networkController = Get.put(NetworkController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomBarScreenController.selectedIndex.value,
        onTap: bottomBarScreenController.onTabBarTap,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Obx(
                () => bottomBarScreenController.selectedIndex.value == 0
                    ? Image.asset(
                        stringHelper.userColorIcon,
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        stringHelper.user,
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
              ),
              backgroundColor: Colors.white,
              label: ''),
          BottomNavigationBarItem(
              icon: Obx(
                () => bottomBarScreenController.selectedIndex.value == 1
                    ? Image.asset(
                        stringHelper.taskColorIcon,
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        stringHelper.taskIcon,
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
              ),
              backgroundColor: Colors.white,
              label: ''),
          BottomNavigationBarItem(
              icon: Obx(
                () => bottomBarScreenController.selectedIndex.value == 2
                    ? Image.asset(
                        stringHelper.homeIcon,
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        stringHelper.homeIcon,
                        color: Colors.grey.shade400,
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
              ),
              backgroundColor: Colors.white,
              label: ''),
          BottomNavigationBarItem(
              icon: Obx(
                () => bottomBarScreenController.selectedIndex.value == 3
                    ? Image.asset(
                        stringHelper.chatColorIcon,
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        stringHelper.chatIcon,
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
              ),
              backgroundColor: Colors.white,
              label: ''),
          BottomNavigationBarItem(
              icon: Obx(
                () => bottomBarScreenController.selectedIndex.value == 4
                    ? Image.asset(
                        stringHelper.menuColorIcon,
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        stringHelper.menuIcon,
                        width: 24,
                        height: 24,
                        fit: BoxFit.contain,
                      ),
              ),
              backgroundColor: Colors.white,
              label: ''),
        ],
      ),
      body: Obx(
        () => IndexedStack(
          index: bottomBarScreenController.selectedIndex.value,
          children: [
            RespondScreen(),
            TaskScreen(),
            HomeScreen(),
            ChatScreen(),
            MenuPage(),
          ],
        ),
      ),
    ));
  }
}

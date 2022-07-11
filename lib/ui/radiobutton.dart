import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/signup_controller.dart';

class RadioBtnWidget extends StatelessWidget {
  final SignUpController signUpController = Get.put(SignUpController());

  RadioBtnWidget({Key? key}) : super(key: key);

  // late List<User> users;
  // late User selectedUser;
  // late int selectedRadio;
  // late int selectedRadioTile;

  // @override
  // void initState() {
  //   // selectedRadio = 0;
  //   // selectedRadioTile = 0;
  //   // users = User.getUsers();
  //   // selectedUser = User();
  //   super.initState();
  // }

  // setSelectedRadio(int val) {
  //   setState(() {
  //     selectedRadio = val;
  //   });
  // }

  // setSelectedRadioTile(int val) {
  //   setState(() {
  //     selectedRadioTile = val;
  //   });
  // }

  // setSelectedUser(User user) {
  //   setState(() {
  //     selectedUser = user;
  //   });
  // }

  // List<Widget> createRadioListUsers() {
  //   List<Widget> widgets = [];
  //   for (User user in users) {
  //     widgets.add(
  //       RadioListTile(
  //         value: user,
  //         // selectedTileColor: const Color(0xFF424752),
  //         // tileColor: const Color(0xFF424752),
  //         groupValue: selectedUser,
  //         title: Text(user.gender!),
  //         onChanged: (currentUser) {
  //           print("Current User ${currentUser.toString()}");
  //           setSelectedUser(currentUser as User);
  //         },
  //         selected: selectedUser == user,
  //         activeColor: Colors.green,
  //       ),
  //     );
  //   }
  //   return widgets;
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            // ...createRadioListUsers(),
            Row(
              children: [
                Obx(
                  () => Radio(
                      value: 1,
                      groupValue: signUpController.selectedRadio.value,
                      // activeColor: Colors.green,
                      hoverColor: Colors.green,
                      onChanged: (value) {
                        print("selected1$value");
                        signUpController.selectGender.value = "Male";
                        print(
                            "signUpController.selectGender.value==${signUpController.selectGender.value}");
                        signUpController.setSelectedRadio(value as int);
                      }),
                ),
                Text("Male"),
                Obx(
                  () => Radio(
                      value: 2,
                      groupValue: signUpController.selectedRadio.value,
                      // activeColor: Colors.green,
                      hoverColor: Colors.green,
                      onChanged: (value) {
                        print("selected2");
                        signUpController.selectGender.value = "Female";
                        print(
                            "signUpController.selectGender.value==${signUpController.selectGender.value}");
                        signUpController.setSelectedRadio(value as int);
                      }),
                ),
                Text("Female"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

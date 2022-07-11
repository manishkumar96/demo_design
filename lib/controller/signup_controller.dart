import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsignup/ui/login_page.dart';

import '../ui/bottombar_screen.dart';
import '../ui/user.dart';

class SignUpController extends GetxController {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  RxBool check = false.obs;
  RxBool visiblePassword = true.obs;
  RxBool visibleConfPassword = true.obs;
  var selectGender = ''.obs;
  var country = ''.obs;

  late List<User> users;
  late User selectedUser;
  late RxInt selectedRadio;
  late RxInt selectedRadioTile;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final usrNameController = TextEditingController();
  final ageController = TextEditingController();
  final passController = TextEditingController();
  final confPassController = TextEditingController();
  final countryController = TextEditingController();
  final locationController = TextEditingController();
  var context;

  @override
  void onInit() {
    selectedRadio = 0.obs;
    selectedRadioTile = 0.obs;
    users = User.getUsers();
    selectedUser = User();
    super.onInit();
  }

  setSelectedRadio(int val) {
    selectedRadio.value = val;
  }

  setSelectedRadioTile(int val) {
    selectedRadioTile.value = val;
  }

  setSelectedUser(User user) {
    selectedUser = user;
  }

  signUp() {
    print("Check==$check");
    if (GetUtils.isBlank(nameController.text.toString())!) {
      Get.showSnackbar(const GetSnackBar(
        message: "enter name",
      ));
    } else if (!GetUtils.isEmail(emailController.text.toString()) ||
        GetUtils.isBlank(emailController.text.toString())!) {
      Get.showSnackbar(const GetSnackBar(
        message: "enter valid email",
      ));
    } else if (!GetUtils.isPhoneNumber(phoneController.text.toString())) {
      Get.showSnackbar(const GetSnackBar(
        message: "Enter phone number",
      ));
    } else if (!GetUtils.isUsername(usrNameController.text.toString())) {
      Get.showSnackbar(const GetSnackBar(
        message: 'Enter UserName',
      ));
    } else if (GetUtils.isBlank(ageController.text.toString())!) {
      Get.showSnackbar(const GetSnackBar(
        message: 'Enter Age',
      ));
    } else if (GetUtils.isBlank(selectGender.toString())!) {
      Get.showSnackbar(const GetSnackBar(
        message: "Select Gender",
      ));
    } else if (GetUtils.isBlank(passController.text.toString())! ||
        GetUtils.isLengthLessThan(passController.text.toString(), 6) ||
        !regex.hasMatch(passController.text.toString())) {
      Get.showSnackbar(const GetSnackBar(
        message:
            "Password contains symbols,characters and numbers and of 6 length,capital and small letter",
      ));
    } else if (GetUtils.isBlank(confPassController.text.toString())! ||
        confPassController.text.toString() != passController.text.toString()) {
      Get.showSnackbar(const GetSnackBar(
        message: 'Confirm Password not match',
      ));
    } else if (GetUtils.isBlank(country.toString())!) {
      Get.showSnackbar(const GetSnackBar(
        message: 'Select Country',
      ));
    } else if (GetUtils.isBlank(locationController.text.toString())!) {
      Get.showSnackbar(const GetSnackBar(
        message: "Enter sub location",
      ));
    } else if (check == false) {
      Get.showSnackbar(const GetSnackBar(
        message: "please agree terms and conditions",
      ));
    } else {
      FocusScope.of(context).requestFocus(FocusNode());
      Get.to(() => BottomBarScreen());
    }
  }

  login() {
    Get.to(() => LoginPage());
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    usrNameController.dispose();
    ageController.dispose();
    passController.dispose();
    confPassController.dispose();
    countryController.dispose();
    locationController.dispose();
    super.onClose();
  }
}

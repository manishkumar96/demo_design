import 'package:flutter/material.dart';

import '../helper/color_helper.dart';
import '../helper/string_helper.dart';

class TaskScreen extends StatelessWidget {
  TaskScreen({Key? key}) : super(key: key);

  final StringHelper stringHelper = StringHelper.getInstance;
  final ColorHelper colorHelper = ColorHelper.getInstance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Text("Task screen"),
    ));
  }
}

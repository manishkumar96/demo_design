import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpField extends StatelessWidget {
  const OtpField(
      {Key? key,
      this.defaultPinTheme,
      this.focusedPinTheme,
      this.submittedPinTheme,
      this.margin,
      this.controller,
      this.length})
      : super(key: key);
  final PinTheme? defaultPinTheme;
  final PinTheme? focusedPinTheme;
  final PinTheme? submittedPinTheme;
  final EdgeInsetsGeometry? margin;
  final TextEditingController? controller;
  final int? length;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Pinput(
        controller: controller,
        length: length!,
        defaultPinTheme: defaultPinTheme,
        focusedPinTheme: focusedPinTheme,
        submittedPinTheme: submittedPinTheme,
        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
        showCursor: true,
      ),
    );
  }
}

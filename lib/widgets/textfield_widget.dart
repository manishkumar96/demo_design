import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    required this.obscureText,
    this.margin,
    this.focusNode,
    this.borderColor,
    this.textColor,
    this.text,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.contentPadding,
    this.suffixIcon,
    this.inputFormatters,
    this.decoration,
    this.maxLines,
    this.disabledBorder,
  }) : super(key: key);

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final EdgeInsetsGeometry? margin, contentPadding;
  final FocusNode? focusNode;
  final Color? borderColor, textColor;
  final String? text;
  final String? fontFamily;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final Decoration? decoration;
  final int? maxLines;
  final InputBorder? disabledBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      decoration: decoration,
      child: TextFormField(
        autocorrect: false,
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        textInputAction: textInputAction,
        obscureText: obscureText,
        maxLines: maxLines,
        focusNode: focusNode,
        style: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: fontFamily,
            fontSize: fontSize,
            color: textColor,
            fontWeight: fontWeight),
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          isDense: true,
          contentPadding: contentPadding,
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xFF424752),
          )),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xFF424752),
          )),
        ),
      ),
    );
  }
}

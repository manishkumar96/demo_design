import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    Key? key,
    this.text,
    this.margin,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.height,
    this.width,
    this.onTap,
    this.border,
    this.containerColor,
    this.padding,
  }) : super(key: key);
  final String? text;
  final EdgeInsetsGeometry? margin;
  final String? fontFamily;
  final double? fontSize, height, width;
  final FontWeight? fontWeight;
  final Color? color;
  final GestureTapCallback? onTap;
  final BoxBorder? border;
  Color? containerColor = const Color(0xFF222C82);
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: containerColor,
            border: border,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              color: color,
              fontWeight: fontWeight,
              fontFamily: fontFamily,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}

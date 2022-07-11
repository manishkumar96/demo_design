import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  TextWidget(
      {Key? key,
      this.text,
      this.fontFamily,
      this.fontSize,
      this.color,
      this.fontWeight,
      this.margin,
      this.decoration,
      this.decorationColor,
      this.decorationThickness,
      this.onTap,
      this.height,
      this.width,
      this.textAlign})
      : super(key: key);

  final String? text;
  final String? fontFamily;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? margin;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final double? decorationThickness;
  final GestureTapCallback? onTap;
  final double? height, width;
  TextAlign? textAlign = TextAlign.center;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        height: height,
        width: width,
        child: Text(
          text!,
          textAlign: textAlign,
          style: TextStyle(
              decorationThickness: decorationThickness,
              decoration: decoration,
              decorationColor: decorationColor,
              fontFamily: fontFamily,
              fontSize: fontSize,
              color: color,
              fontWeight: fontWeight),
        ),
      ),
    );
  }
}

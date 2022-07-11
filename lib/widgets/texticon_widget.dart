import 'package:flutter/material.dart';

class TextIconWidget extends StatelessWidget {
  const TextIconWidget({
    Key? key,
    this.margin,
    this.name,
    this.fit,
    this.text,
    this.fontSize,
    this.fontFamily,
    this.fontWeight,
    this.color,
    this.textAlign,
    this.padding,
    this.imageHeight,
    this.imageWidth,
    this.containerHeight,
    this.containerWidth,
    this.containerColor,
    this.borderRadius,
    this.imagePadding,
  }) : super(key: key);
  final EdgeInsetsGeometry? margin;
  final String? name, text;
  final double? imageHeight,
      imageWidth,
      fontSize,
      containerHeight,
      containerWidth;
  final BoxFit? fit;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Color? color, containerColor;
  final TextAlign? textAlign;
  final EdgeInsetsGeometry? padding, imagePadding;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: containerHeight,
      width: containerWidth,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: borderRadius,
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 6),
            child: Image.asset(
              name!,
              height: imageHeight,
              width: imageWidth,
              fit: fit,
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.only(left: 7),
          //   child:
          Expanded(
            child: Text(
              text!,
              textAlign: textAlign,
              style: TextStyle(
                fontFamily: fontFamily,
                fontWeight: fontWeight,
                fontSize: fontSize,
                color: color,
              ),
            ),
          ),
          // )
        ],
      ),
    );
  }
}

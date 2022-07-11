import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    this.margin,
    this.height,
    this.width,
    required this.name,
    this.fit,
    this.color,
    this.padding,
  }) : super(key: key);
  final EdgeInsetsGeometry? margin;
  final double? height, width;
  final String name;
  final BoxFit? fit;
  final Color? color;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(80)),
      ),
      margin: margin,
      height: height,
      width: width,
      padding: padding,
      child: Image.asset(
        name,
        fit: fit,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginsignup/widgets/text_widgets.dart';

import 'image_widget.dart';

class TextFieldIcon extends StatelessWidget {
  const TextFieldIcon({
    Key? key,
    this.keyboardType,
    this.textInputAction,
    this.border,
    this.focusedBorder,
    this.enabledBorder,
    this.isDense,
    this.image,
    this.text,
    this.height,
    this.width,
    this.margin,
    this.textFontSize,
    this.inputFormatters,
    this.errorBorder,
    this.boxBorder,
    this.borderRadius,
    this.padding,
    this.hintText,
  }) : super(key: key);
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final bool? isDense;
  final String? image, text;
  final double? height, width, textFontSize;
  final EdgeInsetsGeometry? margin;
  final List<TextInputFormatter>? inputFormatters;
  final InputBorder? errorBorder;
  final BoxBorder? boxBorder;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? padding;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(border: boxBorder, borderRadius: borderRadius),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              autocorrect: false,
              keyboardType: keyboardType,
              inputFormatters: inputFormatters,
              textInputAction: textInputAction,
              decoration: InputDecoration(
                hintText: hintText,
                border: border,
                focusedBorder: focusedBorder,
                enabledBorder: enabledBorder,
                errorBorder: errorBorder,
                isDense: isDense,
              ),
            ),
          ),
          ImageWidget(
            name: image!,
            height: height,
            width: width,
          ),
          TextWidget(
            margin: margin,
            text: text,
            fontSize: textFontSize,
          ),
        ],
      ),
    );
  }
}

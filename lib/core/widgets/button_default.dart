import 'package:fashion/core/widgets/text_default.dart';
import 'package:flutter/material.dart';

class ButtonCustomWidget extends StatelessWidget {
  String? text;
  Color? color;
  Color? buttonColor;
  double? buttonWidth;
  double? buttonHeight;
  double radius;
  double textSize;
  double horizontalPadding;
  dynamic onPressed;
  FontWeight? fontWeightText;
  Color borderColor;
  Widget? loadingWidget;

  ButtonCustomWidget({
    super.key,
    this.text,
    this.color,
    this.radius = 10,
    this.textSize = 16,
    this.buttonColor,
    this.buttonWidth,
    this.onPressed,
    this.buttonHeight,
    this.fontWeightText = FontWeight.w700,
    this.horizontalPadding = 0,
    this.borderColor = Colors.transparent,
    this.loadingWidget
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        padding: EdgeInsetsDirectional.symmetric(horizontal: horizontalPadding),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor)
        ),
        alignment: Alignment.center,
        child:loadingWidget ?? TextWidget(
          text: "$text",
          fontColor: color,
          fontWeight: fontWeightText,
          fontSize: textSize,
        ),
      ),
    );
  }
}

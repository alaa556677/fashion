import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  double? fontSize;
  double? wordSpacing;
  double? height;
  FontWeight? fontWeight;
  Color? fontColor;
  String? fontFamily;
  String? text;
  TextAlign align;
  bool? isMultiLine;
  bool? isInSearch;
  InlineSpan? textSpan;
  TextDecoration? textDecoration;
  Color? decorationColor;
  TextOverflow? overFlow;
  int? maxLines;
  RichTextWidget(
      {super.key, this.text,
        this.fontSize,
        this.fontColor,
        this.fontWeight,
        this.fontFamily,
        this.align = TextAlign.start,
        this.wordSpacing,
        this.height,
        this.isMultiLine = false,
        this.isInSearch = false,
        this.textSpan,
        this.textDecoration,
        this.decorationColor, this.overFlow,
        this.maxLines});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: align,
        maxLines: maxLines,
        text : TextSpan(
            text: text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              overflow: overFlow,
              color: fontColor,
              fontFamily: fontFamily,
              wordSpacing: wordSpacing,
              height: height,
              decoration : textDecoration,
              decorationColor: decorationColor,
            )
        )
    );
  }
}

import 'package:flutter/material.dart';

class AppFontWeight{
  static FontWeight normal = FontWeight.w300;
  static FontWeight regular = FontWeight.w400;
  static FontWeight medium = FontWeight.w500;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight mediumBold = FontWeight.w700;
  static FontWeight bold = FontWeight.w800;
}

class AppScreenSize {
  static screenWidth (BuildContext context) => MediaQuery.of(context).size.width;
  static screenHeight (BuildContext context) => MediaQuery.of(context).size.height;
}


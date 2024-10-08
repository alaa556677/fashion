import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ColorProductWidget extends StatelessWidget{
  final Color colorProduct;
  const ColorProductWidget({super.key, required this.colorProduct});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56.w,
      height: 56.h,
      decoration: BoxDecoration(
        color: colorProduct,
        borderRadius: BorderRadius.circular(8.r)
      ),
    );
  }
}
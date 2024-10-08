import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonIncrement extends StatelessWidget{
  final void Function()? onTap;
  final Widget child;
  final Color buttonColor;
  final double radius;
  final double verticalPadding;

  const ButtonIncrement({
    super.key,
    required this.child,
    this.onTap,
    this.radius = 4,
    this.buttonColor = Colors.transparent,
    this.verticalPadding = 0
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        // width: 32.w,
        // height: 32.h,
        padding: EdgeInsetsDirectional.symmetric(horizontal: 6.w, vertical: verticalPadding),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: child,
      ),
    );
  }
}
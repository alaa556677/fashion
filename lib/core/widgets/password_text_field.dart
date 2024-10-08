import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';

class PasswordTextFormField extends StatefulWidget {
  PasswordTextFormField({
    super.key,
    this.prefix,
    this.hintText,
    this.textInputType,
    this.height,
    this.suffix,
    this.color,
    this.controller,
    this.borderRadius,
    this.onSubmitted,
    this.onTap,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.helperText,
    this.hintColor,
    this.filledColor,
    this.hintTextSize,
    this.fontSize,
    this.border,
    this.maxLines,
    this.readOnly
  });
  double? height;
  Widget? prefix;
  Widget? suffix;
  TextInputType? textInputType;
  String? hintText;
  Color? color;
  TextEditingController? controller;
  Function(String)? onSubmitted;
  Function()? onTap;
  final Function(String value)? onChanged;
  double? borderRadius;
  bool obscureText;
  dynamic validator;
  String? helperText;
  Color? hintColor;
  Color? filledColor;
  double? hintTextSize;
  double? fontSize;
  InputBorder? border;
  int? maxLines;
  bool? readOnly;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  double? width;
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.16),
                offset: const Offset(0,0),
                blurRadius: 8
            )
          ]
      ),
      child: TextFormField(
        onTap: widget.onTap,
        readOnly: widget.readOnly ?? false,
        onChanged:(value)=> widget.onChanged?.call(value),
        validator: widget.validator,
        onFieldSubmitted: widget.onSubmitted,
        controller: widget.controller,
        keyboardType: widget.textInputType,
        obscureText: isPasswordVisible,
        maxLines: widget.maxLines??1,
        style: TextStyle(color:widget.hintColor,fontSize:widget.fontSize,fontFamily: 'Dexef' ),
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: EdgeInsetsDirectional.symmetric(horizontal: 15.w),
            child: Focus(
                descendantsAreFocusable: false,
                canRequestFocus: false,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                  icon: Icon(isPasswordVisible
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined),
                  iconSize: 20,
                  color: AppColors.greyColor,
                  autofocus: false,
                  focusNode: FocusNode(
                      canRequestFocus: false, descendantsAreFocusable: false),
                )),
          ),
          prefixIcon: widget.prefix,
          filled: true,
          fillColor: widget.filledColor ,
          contentPadding:
          EdgeInsets.symmetric(horizontal: 7.w,vertical: 3.h),
          hintText: '${widget.hintText}',
          hintStyle: TextStyle(fontSize:widget.hintTextSize?? 14.sp, color:widget.hintColor ??AppColors.hintColor,fontFamily: 'Dexef',),
          border:  widget.border ?? OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ??10.r),
            borderSide: const BorderSide(),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ??10.r),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ??10.r),
            borderSide:  const BorderSide(
              color: Colors.transparent,
            ),
          ),
          errorStyle: TextStyle(fontSize: 12.sp,),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ??10.r),
              borderSide: const BorderSide(
                width: 1,
                color: Colors.red,
              )),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(widget.borderRadius ??10.r),
            borderSide: const BorderSide(
              width: 1,
              color: Colors.red,
            ),
          ),
        ),

      ),
    );
  }
}
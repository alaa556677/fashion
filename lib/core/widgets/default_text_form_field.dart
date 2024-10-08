import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/colors.dart';



class DefaultTextFormField extends StatefulWidget {
  DefaultTextFormField({
    Key? key,
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
    this.readOnly,
    this.inputFormatters
  }) : super(key: key);
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
  List<TextInputFormatter>? inputFormatters;
  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  double? width;

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
        inputFormatters:widget.inputFormatters,
        readOnly: widget.readOnly ?? false,
        onChanged:(value)=> widget.onChanged?.call(value),
        validator: widget.validator,
        onFieldSubmitted: widget.onSubmitted,
        controller: widget.controller,
        keyboardType: widget.textInputType,
        obscureText: widget.obscureText,
        maxLines: widget.maxLines??1,
        style: TextStyle(color:widget.hintColor,fontSize:widget.fontSize,fontFamily: 'Dexef' ),
        decoration: InputDecoration(
          suffixIcon: widget.suffix,
          prefixIcon: widget.prefix,
          filled: true,
          fillColor: widget.filledColor ,
          contentPadding:
          EdgeInsets.symmetric(horizontal: 7.w,vertical: 3.h),
          hintText: '${widget.hintText}',
          hintStyle: TextStyle(fontSize:widget.hintTextSize?? 12.sp, color:widget.hintColor ??AppColors.hintColor,fontFamily: 'Dexef',),
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


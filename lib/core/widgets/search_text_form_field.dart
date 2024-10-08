import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/icons_path.dart';
import '../styles/colors.dart';

class SearchTextForm extends StatelessWidget{
  final TextEditingController searchController;
  final double radius;
  final Color borderColor;

  const SearchTextForm({super.key,
    required this.searchController,
    this.radius = 10,
    this.borderColor = Colors.transparent
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: AppColors.textFormColor,
        border: Border.all(color: borderColor)
      ),
      child: TextFormField(
        controller: searchController,
        style: TextStyle(
          color: AppColors.blackColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w300,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Padding(
            padding: EdgeInsetsDirectional.only(start: 20.w),
            child: SvgPicture.asset(AppIconsPath.searchIcon, height: 18.h, width: 18.w,),
          ),
          // prefixIcon: Icon(Icons.search, color: AppColors.textFormBorderColor),
          hintText: 'Search',
          hintStyle: TextStyle(
            color: AppColors.textColorOnBoarding,
            fontSize: 14.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/images_path.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/widgets/text_default.dart';

class CardCategoryItems extends StatelessWidget{
  const CardCategoryItems({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190.w,
      height: 122.h,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(.16),
            offset: const Offset (0,0),
            blurRadius: 6,
          )
        ]
      ),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                text: 'Gym Walker',
                fontColor: AppColors.textColorCategory,
                fontSize: 14.sp,
                fontWeight: AppFontWeight.semiBold,
              ),
              SizedBox(height: 18.h,),
              TextWidget(
                text: 'Show More',
                fontColor: AppColors.buttonColorAll,
                fontSize: 14.sp,
                fontWeight: AppFontWeight.semiBold,
                textDecoration: TextDecoration.underline,
                decorationColor: AppColors.buttonColorAll,
              ),
            ],
          ),
          Container(
            width: 60.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImagesPath.gymWalker)
              )
            ),
          )
        ],
      ),
    );
  }
}
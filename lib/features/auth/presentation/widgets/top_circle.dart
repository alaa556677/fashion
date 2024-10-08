import 'package:fashion/core/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/images_path.dart';

class TopCircle extends StatelessWidget {
  const TopCircle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 120.h,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              SizedBox(
                width: 40.w,
                height: 22.h,
                child: Transform.scale(
                  scale: 7.r,
                  child: SvgPicture.asset(AppImagesPath.topCircle, color: AppColors.indicatorColor,),
                ),
              ),
              SizedBox(
                width: 40.w,
                height: 22.h,
                child: Transform.scale(
                  scale: 7.r,
                  child: SvgPicture.asset(AppImagesPath.minCircleLogin, color: AppColors.indicatorColor,),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

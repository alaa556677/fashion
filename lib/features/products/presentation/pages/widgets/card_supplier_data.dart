import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/constants/constants_methods.dart';
import '../../../../../core/constants/icons_path.dart';
import '../../../../../core/constants/navigate_methods.dart';
import '../../../../../core/constants/routes.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/widgets/button_default.dart';
import '../../../../../core/widgets/text_default.dart';
import '../../../../company/presentation/pages/company_data_screen.dart';
import '../../../data/model/products_data_model.dart';

class CardSupplierData extends StatelessWidget{
  final SuppliersData suppliersData;
  const CardSupplierData({super.key, required this.suppliersData});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppScreenSize.screenWidth(context),
      decoration: BoxDecoration(
        color: AppColors.buttonColorAll.withOpacity(.10),
        borderRadius: BorderRadius.circular(6.r),
      ),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: suppliersData.supplierName,
            fontWeight: AppFontWeight.mediumBold,
            fontSize: 14.sp,
            fontColor: AppColors.labelColor,
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 10.h,),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    SvgPicture.asset(AppIconsPath.locationIcon),
                    SizedBox(width: 10.w,),
                    TextWidget(
                      text: suppliersData.supplierAddress.countryName,
                      fontWeight: AppFontWeight.semiBold,
                      fontSize: 12.sp,
                      fontColor: AppColors.labelColor,
                    ),
                  ],
                )
              ),
              Expanded(
                  child: TextWidget(
                    text: '-  ${suppliersData.supplierAddress.cityName}',
                    fontWeight: AppFontWeight.semiBold,
                    fontSize: 12.sp,
                    fontColor: AppColors.labelColor,
                  )
              )
            ],
          ),
          SizedBox(height: 12.h,),
          Row(
            children: [
              SvgPicture.asset(AppIconsPath.reviewIcon),
              SizedBox(width: 10.w,),
              TextWidget(
                text: suppliersData.review,
                fontWeight: AppFontWeight.semiBold,
                fontSize: 12.sp,
                fontColor: AppColors.labelColor,
              ),
              SizedBox(width: 10.w,),
              TextWidget(
                text: suppliersData.createFrom,
                fontWeight: AppFontWeight.semiBold,
                fontSize: 12.sp,
                fontColor: AppColors.labelColor,
              )
            ],
          ),
          SizedBox(height: 12.h,),
          Row(
            children: [
              Expanded(
                child: ButtonCustomWidget(
                  text: 'Product',
                  borderColor: AppColors.textFormBorderColor,
                  buttonColor: Colors.transparent,
                  textSize: 14.sp,
                  buttonHeight: 36.h,
                  color: AppColors.labelColor,
                  fontWeightText: AppFontWeight.regular,
                  radius: 20.r,
                ),
              ),
              SizedBox(width: 10.w,),
              Expanded(
                child: ButtonCustomWidget(
                  text: 'Company Profile',
                  borderColor: Colors.transparent,
                  buttonColor: AppColors.buttonColorAll.withOpacity(.50),
                  textSize: 14.sp,
                  buttonHeight: 36.h,
                  color: AppColors.labelColor,
                  fontWeightText: AppFontWeight.regular,
                  radius: 20.r,
                  onPressed: (){
                    navigateToNamed(route: Routes.companyDataScreen, arguments: {
                      "suppliersData" : suppliersData
                    });
                  },
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
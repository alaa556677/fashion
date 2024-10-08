import 'package:fashion/features/company/presentation/pages/widgets/card_category_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/constants_methods.dart';
import '../../../../core/constants/icons_path.dart';
import '../../../../core/constants/images_path.dart';
import '../../../../core/constants/navigate_methods.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/button_default.dart';
import '../../../../core/widgets/richText_default.dart';
import '../../../../core/widgets/text_default.dart';
import '../../../home/presentation/cubit/home_cubit.dart';
import '../../../home/presentation/pages/widgets/view_more_widget.dart';
import '../../../products/data/model/products_data_model.dart';
import 'chat_screen.dart';

class CompanyHomeDataScreen extends StatelessWidget{
  final SuppliersData suppliersData;
  const CompanyHomeDataScreen({super.key, required this.suppliersData});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: 'Description :',
                  fontColor: AppColors.labelColor,
                  fontSize: 16.sp,
                  fontWeight: AppFontWeight.regular,
                ),
                SizedBox(height: 18.h,),
                RichTextWidget(
                  text: suppliersData.description,
                  fontColor: AppColors.textColorOnBoarding,
                  fontSize: 16.sp,
                  fontWeight: AppFontWeight.regular,
                ),
                SizedBox(height: 18.h,),
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
                SizedBox(height: 14.h,),
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
                SizedBox(height: 34.h,),
                TextWidget(
                  text: 'Category',
                  fontColor: AppColors.textColorCategory,
                  fontSize: 18.sp,
                  fontWeight: AppFontWeight.semiBold,
                ),
                SizedBox(height: 14.h,),
                SizedBox(
                  height: 130.h,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 10,
                        childAspectRatio: 190/122
                    ),
                    itemBuilder: (context, index) => const CardCategoryItems(),
                    itemCount: 2,
                  ),
                ),
                SizedBox(height: 14.h,),
                TextWidget(
                  text: 'Our Certifications',
                  fontColor: AppColors.textColorCategory,
                  fontSize: 18.sp,
                  fontWeight: AppFontWeight.semiBold,
                ),
                SizedBox(height: 14.h,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 120.h,
                        decoration: BoxDecoration(
                            image:  const DecorationImage(
                                image: AssetImage(AppImagesPath.certificateOne),
                                fit: BoxFit.fill
                            ),
                            borderRadius: BorderRadius.circular(10.r)
                        ),
                      ),
                    ),
                    SizedBox(width: 12.w,),
                    Expanded(
                      child: Container(
                        height: 120.h,
                        decoration: BoxDecoration(
                            image: const DecorationImage(
                                image: AssetImage(AppImagesPath.certificateTwo),
                                fit: BoxFit.fill
                            ),
                            borderRadius: BorderRadius.circular(10.r)
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h,),
                ViewMoreWidget(
                  title: 'Recently Arrive',
                  list: HomeCubit.instance.recentlyArriveList,
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 70.h,
          width: AppScreenSize.screenWidth(context),
          color: AppColors.whiteColor,
          padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Expanded(
                child: ButtonCustomWidget(
                  text: 'Chat Now',
                  borderColor: AppColors.textFormBorderColor,
                  buttonColor: Colors.transparent,
                  textSize: 14.sp,
                  buttonHeight: 36.h,
                  color: AppColors.labelColor,
                  fontWeightText: AppFontWeight.regular,
                  radius: 20.r,
                  onPressed: (){
                    navigateToNamed(route: Routes.chatScreen, arguments: {
                      "suppliersData" : suppliersData,
                      "messagesList" : HomeCubit.instance.messagesList
                    });
                  },
                ),
              ),
              SizedBox(width: 10.w,),
              Expanded(
                child: ButtonCustomWidget(
                  text: 'Send Inquiry',
                  borderColor: Colors.transparent,
                  buttonColor: AppColors.buttonColorAll.withOpacity(.50),
                  textSize: 14.sp,
                  buttonHeight: 36.h,
                  color: AppColors.labelColor,
                  fontWeightText: AppFontWeight.regular,
                  radius: 20.r,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
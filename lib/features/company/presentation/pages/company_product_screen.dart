import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/button_default.dart';
import '../../../home/presentation/cubit/home_cubit.dart';
import '../../../home/presentation/pages/widgets/product_card.dart';

class CompanyProductScreen extends StatelessWidget{
  const CompanyProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 10,
                childAspectRatio: 194/320
            ),
            itemBuilder: (context, index) => ProductCard(
              productDataModel: HomeCubit.instance.companyProducts[index],
            ),
            itemCount: HomeCubit.instance.companyProducts.length,
          ),
        ),
        SizedBox(height: 30.h,),
        // Container(
        //   height: 70.h,
        //   width: AppScreenSize.screenWidth(context),
        //   color: AppColors.whiteColor,
        //   padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
        //   child: Row(
        //     children: [
        //       Expanded(
        //         child: ButtonCustomWidget(
        //           text: 'Chat Now',
        //           borderColor: AppColors.textFormBorderColor,
        //           buttonColor: Colors.transparent,
        //           textSize: 14.sp,
        //           buttonHeight: 36.h,
        //           color: AppColors.labelColor,
        //           fontWeightText: AppFontWeight.regular,
        //           radius: 20.r,
        //         ),
        //       ),
        //       SizedBox(width: 10.w,),
        //       Expanded(
        //         child: ButtonCustomWidget(
        //           text: 'Send Inquiry',
        //           borderColor: Colors.transparent,
        //           buttonColor: AppColors.buttonColorAll.withOpacity(.50),
        //           textSize: 14.sp,
        //           buttonHeight: 36.h,
        //           color: AppColors.labelColor,
        //           fontWeightText: AppFontWeight.regular,
        //           radius: 20.r,
        //         ),
        //       ),
        //     ],
        //   ),
        // )
      ],
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/widgets/text_default.dart';
import '../../../../products/data/model/products_data_model.dart';
import '../../../data/models/product_model.dart';

class ProductCard extends StatelessWidget{
  final ProductDataModel productDataModel;
  const ProductCard({
    super.key,
    required this.productDataModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 272.h,
      width: 194.w,
      decoration: BoxDecoration(
        color: AppColors.buttonColorCategory,
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 114.h,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(productDataModel.productModel.imagePath),
                )
            ),
          ),
          SizedBox(height: 16.h,),
          SizedBox(
            height: 60.h,
            child: TextWidget(
              text: productDataModel.productModel.productName,
              fontColor: AppColors.textProductColor,
              fontSize: 18.sp,
              maxLines: 1,
              textOverflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 4.h,),
          TextWidget(
            text: productDataModel.productModel.description,
            fontColor: AppColors.textColorOnBoarding,
            fontSize: 14.sp,
            maxLines: 1,
            textOverflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w500,
          ),
          SizedBox(height: 6.h,),
          Row(
            children: [
              Row(
                children: [
                  TextWidget(
                    text: productDataModel.productModel.price,
                    fontColor: AppColors.buttonColorAll,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(width: 8.w,),
                  TextWidget(
                    text: '\$',
                    fontColor: AppColors.blackColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
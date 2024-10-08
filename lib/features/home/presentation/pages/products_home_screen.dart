import 'package:fashion/features/home/presentation/pages/widgets/view_more_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/enum_constants.dart';
import '../../../../core/constants/images_path.dart';
import '../../../../core/constants/navigate_methods.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/shared/cache_helper.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/button_default.dart';
import '../../../../core/widgets/text_default.dart';
import '../../../products/presentation/cubit/products_cubit.dart';
import '../../../products/presentation/cubit/products_states.dart';
import '../cubit/home_cubit.dart';

class ProductsHomeScreen extends StatelessWidget{
  const ProductsHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
              width: AppScreenSize.screenWidth(context),
              height: 202.h,
              child: SvgPicture.asset(AppImagesPath.productBackground)),
          SizedBox(height: 20.h,),
          SizedBox(
            height: 34.h,
            child: Row(
              children: [
                ButtonCustomWidget(
                  text: 'All',
                  buttonHeight: 34.h,
                  buttonColor: AppColors.buttonColorAll,
                  buttonWidth: 86.w,
                  textSize: 16.sp,
                  fontWeightText: FontWeight.w400,
                  color: AppColors.whiteColor,
                ),
                SizedBox(width: 10.w,),
                Expanded(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ButtonCustomWidget(
                      text: HomeCubit.instance.categoryList[index].name,
                      horizontalPadding: 12.w,
                      buttonColor: AppColors.buttonColorCategory,
                      color: AppColors.textColorCategory,
                      fontWeightText: FontWeight.w300,
                      textSize: 16.sp,
                    ),
                    separatorBuilder: (context, index) => SizedBox(width: 10.w,),
                    itemCount: HomeCubit.instance.categoryList.length
                  )
                )
              ],
            ),
          ),
          SizedBox(height: 28.h,),
          const TextWidget(
            text: 'Products',
          ),
          SizedBox(
            child: BlocConsumer<ProductsCubit, ProductsStates>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return state is GetProductLoadingState ? Image.asset('assets/images/loading_icon.gif')
                : Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  // alignment: WrapAlignment.center,
                  children: ProductsCubit.instance.allProductsEntity!.data!.map((item){
                    return Container(
                      height: 272.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                        color: AppColors.buttonColorCategory,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      padding: EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical: 12.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: (){
                                  CacheHelper.saveData(key:Constants.addProduct.toString(),value: false);
                                  CacheHelper.saveData(key:Constants.productId.toString(),value: item.id);
                                  navigateToNamed(route: Routes.addProductScreen);
                                },
                                icon:Icon(Icons.edit,color: AppColors.tabTextSelected,),
                              ),
                            ],
                          ),
                          Container(
                            height: 90.h,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/product-preview.png'),
                                  fit: BoxFit.fill
                                )
                            ),
                          ),
                          SizedBox(height: 12.h,),
                          SizedBox(
                            height: 35.h,
                            child: TextWidget(
                              text: item.name!,
                              fontColor: AppColors.textProductColor,
                              fontSize: 14.sp,
                              maxLines: 1,
                              textOverflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4.h,),
                          TextWidget(
                            text: 'description',
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
                                    text: item.price.toString(),
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

                      Container(
                      height: 120.h,
                      // width: 140.w,
                      decoration: BoxDecoration(
                        color: AppColors.buttonColorCategory,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      // padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 12.h),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/images/product-preview.png',
                            width: MediaQuery.of(context).size.width *0.3,
                            height: 200.h,
                            fit: BoxFit.contain,
                          ),
                          TextWidget(
                            text: item.name ?? '',
                            fontColor: AppColors.textProductColor,
                            fontSize: 16.sp,
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w500,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: (){
                                  CacheHelper.saveData(key:Constants.addProduct.toString(),value: false);
                                  CacheHelper.saveData(key:Constants.productId.toString(),value: item.id);
                                  navigateToNamed(route: Routes.addProductScreen);
                                },
                                icon:Icon(Icons.edit,color: AppColors.tabTextSelected,),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                );
              },
            )
          ),
          ViewMoreWidget(
            title: 'Top Rank',
            list: HomeCubit.instance.topRankList,
          ),
          SizedBox(height: 20.h,),
          ViewMoreWidget(
            title: 'Vehicle Parts',
            list: HomeCubit.instance.vehiclePartsList,
          ),
          SizedBox(height: 20.h,),
          ViewMoreWidget(
            title: 'Modern',
            list: HomeCubit.instance.modernList,
          ),
          SizedBox(height: 20.h,),
          TextWidget(
            text: 'Just For You',
            fontWeight: AppFontWeight.bold,
            fontSize: 18.sp,
            fontColor: AppColors.textColorCategory,
          ),
          SizedBox(height: 18.h,),
          Container(
            width: AppScreenSize.screenWidth(context),
            height: 148.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImagesPath.mediaOne),
                fit: BoxFit.fill,
              )
            ),
          ),
          SizedBox(height: 10.h,),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 148.h,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImagesPath.mediaTwo),
                        fit: BoxFit.fill,
                      )
                  ),
                ),
              ),
              SizedBox(width: 10.w,),
              Expanded(
                child: Container(
                  height: 148.h,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppImagesPath.mediaThree),
                        fit: BoxFit.fill,
                      )
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          ViewMoreWidget(
            title: 'Others',
            list: HomeCubit.instance.modernList,
          ),
          SizedBox(height: 20.h,),
        ],
      ),
    );
  }
}
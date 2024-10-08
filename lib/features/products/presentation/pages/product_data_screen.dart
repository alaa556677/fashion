import 'package:fashion/features/products/presentation/pages/widgets/button_increment.dart';
import 'package:fashion/features/products/presentation/pages/widgets/card_supplier_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/constants_methods.dart';
import '../../../../core/constants/icons_path.dart';
import '../../../../core/constants/navigate_methods.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/styles/hex_color.dart';
import '../../../../core/widgets/button_default.dart';
import '../../../../core/widgets/richText_default.dart';
import '../../../../core/widgets/screen_default.dart';
import '../../../../core/widgets/text_default.dart';
import '../../../company/presentation/pages/chat_screen.dart';
import '../../../home/presentation/cubit/home_cubit.dart';
import '../../../home/presentation/cubit/home_states.dart';
import '../../../home/presentation/pages/widgets/view_more_widget.dart';
import '../../data/model/products_data_model.dart';

class ProductsDataScreen extends StatefulWidget{
  const ProductsDataScreen({super.key});
  @override
  State<ProductsDataScreen> createState() => _ProductsDataScreenState();
}

class _ProductsDataScreenState extends State<ProductsDataScreen> {
  int numberOfProduct = 1 ;
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return DefaultScreen(
          sizeAppbar: Size.zero,
          backgroundColor: AppColors.whiteColor,
          horizontalPadding: 0,
          body: Column(
            children: [
              Expanded(child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: AppScreenSize.screenHeight(context) * .25,
                      width: AppScreenSize.screenWidth(context),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(arguments["productDataModel"].productModel.imagePath),
                        ),
                      ),
                    ),
                    Container(width: AppScreenSize.screenWidth(context), height: 1.h, color: AppColors.buttonColorCategory,),
                    SizedBox(height: 20.h,),
                    Padding(
                      padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichTextWidget(
                                      text: arguments["productDataModel"].productModel.productName,
                                      fontColor: AppColors.buttonColorAll,
                                      fontWeight: AppFontWeight.semiBold,
                                      fontSize: 20.sp,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 12.w,),
                              SvgPicture.asset(AppIconsPath.likeIcon),
                            ],
                          ),
                          SizedBox(height: 40.h,),
                          RichTextWidget(
                            text: arguments["productDataModel"].fullDescription,
                            fontSize: 16.sp,
                            fontWeight: AppFontWeight.regular,
                            fontColor: AppColors.textColorOnBoarding,
                          ),
                          SizedBox(height: 20.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextWidget(
                                text: '${arguments["productDataModel"].productModel.price}  \$',
                                fontColor: AppColors.labelColor,
                                fontWeight: AppFontWeight.mediumBold,
                                fontSize: 24.sp,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ButtonIncrement(
                                    buttonColor: AppColors.buttonColorCategory,
                                    verticalPadding: 15.h,
                                    child: SvgPicture.asset(AppIconsPath.minusIcon),
                                    onTap: (){
                                      setState(() {
                                        if(numberOfProduct > 1){
                                          numberOfProduct --;
                                        }
                                      });
                                    },
                                  ),
                                  Container(
                                    width: 72.w,
                                    height: 32.h,
                                    color: Colors.transparent,
                                    alignment: Alignment.center,
                                    child: TextWidget(
                                      text: numberOfProduct.toString(),
                                      fontSize: 16.sp,
                                      fontWeight: AppFontWeight.regular,
                                      fontColor: AppColors.textColorCategory,
                                    ),
                                  ),
                                  ButtonIncrement(
                                    buttonColor: AppColors.buttonColorAll,
                                    verticalPadding: 6.h,
                                    onTap: (){
                                      setState(() {
                                        numberOfProduct ++;
                                      });
                                    },
                                    child: SvgPicture.asset(AppIconsPath.plusIcon),
                                  ),
                                ],
                              )
                            ],
                          ),
                          // SizedBox(height: 38.h,),
                          // TextWidget(
                          //   text: 'Colors',
                          //   fontColor: AppColors.textColorCategory,
                          //   fontSize: 16.sp,
                          //   fontWeight: AppFontWeight.medium,
                          // ),
                          // SizedBox(height: 16.h,),
                          // Wrap(
                          //   runSpacing: 20.h,
                          //   spacing: 20.w,
                          //   children: arguments["productDataModel"].productColors.map((e) => ColorProductWidget(
                          //     colorProduct: HexColor(e.productColor),
                          //   )).toList(),
                          // ),
                          SizedBox(height: 20.h,),
                          TextWidget(
                            text: 'Attributes',
                            fontColor: AppColors.textColorCategory,
                            fontSize: 16.sp,
                            fontWeight: AppFontWeight.medium,
                          ),
                          SizedBox(height: 8.h,),
                          RichTextWidget(
                            text: arguments["productDataModel"].attributes,
                            fontSize: 16.sp,
                            fontWeight: AppFontWeight.regular,
                            fontColor: AppColors.textColorOnBoarding,
                          ),
                          SizedBox(height: 20.h,),
                          TextWidget(
                            text: 'Suppliers',
                            fontColor: AppColors.textColorCategory,
                            fontSize: 16.sp,
                            fontWeight: AppFontWeight.medium,
                          ),
                          SizedBox(height: 8.h,),
                          CardSupplierData(suppliersData: arguments["productDataModel"].suppliersData,),
                          SizedBox(height: 34.h,),
                          ViewMoreWidget(
                            title: 'Recently Arrive',
                            list: HomeCubit.instance.recentlyArriveList,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),),
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
                            "suppliersData" : arguments["productDataModel"].suppliersData,
                            "messagesList" : HomeCubit.instance.messagesList,
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
          )
        );
      },
    );
  }
}
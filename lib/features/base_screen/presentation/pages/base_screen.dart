import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/enum_constants.dart';
import '../../../../core/constants/icons_path.dart';
import '../../../../core/constants/navigate_methods.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/shared/cache_helper.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/button_default.dart';
import '../../../../core/widgets/screen_default.dart';
import '../../../home/presentation/pages/home_screen.dart';

class BaseScreen extends StatefulWidget{
  const BaseScreen({super.key});
  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int currentNumber = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      sizeAppbar: Size.zero,
      backgroundColor: AppColors.whiteColor,
      topPadding: 30.h,
      body: screens[currentNumber],
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 22.h,),
                          ButtonCustomWidget(
                            text: 'Add Category',
                            color: AppColors.whiteColor,
                            onPressed: (){
                              Navigator.pop(context);
                              CacheHelper.saveData(key:Constants.addCategory.toString(),value: true);
                              navigateToNamed(route: Routes.addCategoryScreen);
                            },
                            buttonHeight: 48.h,
                            buttonColor: AppColors.tabTextSelected ,
                          ),
                          SizedBox(height: 22.h,),
                          ButtonCustomWidget(
                            text: 'Add Product',
                            color: AppColors.whiteColor,
                            onPressed: (){
                              CacheHelper.saveData(key:Constants.addProduct.toString(),value: true);
                              Navigator.pop(context);
                              navigateToNamed(route: Routes.addProductScreen);

                            },
                            buttonHeight: 48.h,
                            buttonColor: AppColors.tabTextSelected ,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
          ),
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (index){
          setState(() {
            currentNumber = index;
          });
        },

        buttonBackgroundColor: AppColors.buttonColorAll,
        backgroundColor: AppColors.buttonColorCategory,
        iconPadding: 12,
        animationCurve: Curves.linear,
        animationDuration: const Duration(milliseconds: 300),
        items: [
          CurvedNavigationBarItem(
            child: SvgPicture.asset(AppIconsPath.homeIcon, color: currentNumber == 0 ? AppColors.whiteColor : AppColors.blackColor),
            label: 'Home',
            labelStyle: TextStyle(
              color: AppColors.labelColor,
              fontSize: 14.sp,
              fontWeight: AppFontWeight.medium
            )
          ),
          CurvedNavigationBarItem(
            child: SvgPicture.asset(AppIconsPath.chatIcon, color: currentNumber == 1 ? AppColors.whiteColor : AppColors.blackColor),
            label: 'Chats',
              labelStyle: TextStyle(
                  color: AppColors.labelColor,
                  fontSize: 14.sp,
                  fontWeight: AppFontWeight.medium
              )
          ),
          CurvedNavigationBarItem(
            child: SvgPicture.asset(AppIconsPath.cartIcon, color: currentNumber == 2 ? AppColors.whiteColor : AppColors.blackColor),
            label: 'Cart',
              labelStyle: TextStyle(
                  color: AppColors.labelColor,
                  fontSize: 14.sp,
                  fontWeight: AppFontWeight.medium
              )
          ),
          CurvedNavigationBarItem(
            child: SvgPicture.asset(AppIconsPath.profileIcon, color: currentNumber == 3 ? AppColors.whiteColor : AppColors.blackColor),
            label: 'Profile',
              labelStyle: TextStyle(
                  color: AppColors.labelColor,
                  fontSize: 14.sp,
                  fontWeight: AppFontWeight.medium
              )
          ),
        ],
      ),
    );
  }
}

List <Widget> screens = [
  const HomeScreen(),
  const HomeScreen(),
  const HomeScreen(),
  const HomeScreen(),
];
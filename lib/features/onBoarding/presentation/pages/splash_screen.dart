import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/constants_methods.dart';
import '../../../../core/constants/images_path.dart';
import '../../../../core/constants/navigate_methods.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/screen_default.dart';
import 'OnBoarding_screen.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), (){
      navigateToAndRemoveNamed(route: Routes.onBoardingScreen);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultScreen(
      sizeAppbar: Size.zero,
      backgroundColor: AppColors.whiteColor,
      horizontalPadding: 0,
      body: Padding(
        padding: EdgeInsetsDirectional.only(
          top: MediaQuery.of(context).size.height * .22
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImagesPath.appLogo, width: 284.w, height: 284.h,),
            // SizedBox(height: 12.h,),
            const Spacer(),
            SvgPicture.asset(AppImagesPath.handsImages),
            // SizedBox(height: 60.h,),
          ],
        ),
      ),
    );
  }
}
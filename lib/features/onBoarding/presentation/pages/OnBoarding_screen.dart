import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/constants/constants_methods.dart';
import '../../../../core/constants/navigate_methods.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/richText_default.dart';
import '../../../../core/widgets/screen_default.dart';
import '../cubit/onBoarding_cubit.dart';
import '../cubit/onBoarding_states.dart';
import 'onBoarding_body.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController? pc;
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    scrollController.addListener(scrollListener);
    super.initState();
  }

  scrollListener() async {
    ScrollPosition position = scrollController.position;
    pc = PageController(viewportFraction: 1);
    if (scrollController.offset == position.maxScrollExtent) {
      pc?.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.linear);
    } else if (scrollController.offset == position.minScrollExtent) {
      pc?.previousPage(duration: const Duration(milliseconds: 100), curve: Curves.linear);
    }else if(scrollController.offset > position.minScrollExtent){
      navigateToNamed(route: Routes.homeScreen);
    }
  }
  @override
  Widget build(BuildContext context) {
    pc = PageController(viewportFraction: 1);
    return BlocConsumer< OnBoardingCubit, OnBoardingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return DefaultScreen(
          sizeAppbar: Size.zero,
          backgroundColor: AppColors.whiteColor,
          body: Column(
            children: [
              OnBoardingCubit.instance.isLast ? Container(
                height: MediaQuery.of(context).size.height * .10,
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: (){
                        if(OnBoardingCubit.instance.isLast){
                          navigateToAndRemoveNamed(route: Routes.login);
                        }
                      },
                      child: RichTextWidget(
                        text: 'Skip',
                        fontColor: AppColors.textColorOnBoarding,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w300,
                        align: TextAlign.end,
                      ),
                    ),
                  ],
                ),
              ): SizedBox(height: MediaQuery.of(context).size.height * .10,),
              Expanded(
                child: PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  controller: pc,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index) {
                    OnBoardingCubit.instance.changeIsLast(index);
                  },
                  itemBuilder: (context, index) => OnBoardingBody(description: onBoardingDescriptions[index]),
                  itemCount: onBoardingDescriptions.length,
                ),
              ),
              SizedBox(height: 30.h),
              SmoothPageIndicator(
                controller: pc!,
                count: onBoardingDescriptions.length,
                effect: ExpandingDotsEffect(
                  dotColor: AppColors.textColorOnBoarding,
                  activeDotColor: AppColors.indicatorColor,
                  dotHeight: 10,
                  dotWidth: 15,
                  expansionFactor: 2,
                ),
              ),
              SizedBox(height: 40.h),
            ],
          ),
        );
      },
    );
  }
}

List <String> onBoardingDescriptions = [
  'A Global Program That Allows Companies And Factories To Introduce Themselves And Display Their Products And Services, Allowing Users And Merchants To Communicate Directly With Suppliers.',
  'We Provide Technical Support, If Possible, To Create A Credible Relationship Of Communication And Complete The Export And Import Process',
];
import 'package:fashion/features/company/presentation/pages/widgets/tab_bar_view_supplier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/icons_path.dart';
import '../../../../core/constants/images_path.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/richText_default.dart';
import '../../../../core/widgets/screen_default.dart';
import '../../../home/presentation/cubit/home_cubit.dart';
import '../../../products/data/model/products_data_model.dart';
import 'company_home_data_screen.dart';
import 'company_product_screen.dart';

class CompanyDataScreen extends StatefulWidget{
  const CompanyDataScreen({super.key});
  @override
  State<CompanyDataScreen> createState() => _CompanyDataScreenState();
}

class _CompanyDataScreenState extends State<CompanyDataScreen> with SingleTickerProviderStateMixin{
  late TabController _tabController;
  late HomeCubit homeCubit;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      HomeCubit.instance.changeTabBarIndexSupplier(_tabController.index);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    homeCubit = HomeCubit.instance;
    homeCubit.changeTabBarIndexSupplier(0);
    homeCubit.initDummy();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    return DefaultScreen(
      sizeAppbar: Size.zero,
      backgroundColor: AppColors.whiteColor,
      horizontalPadding: 0,
      body: Column(
        children: [
          Container(
            height: AppScreenSize.screenHeight(context) * .25,
            width: AppScreenSize.screenWidth(context),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImagesPath.companyField),
                fit: BoxFit.fill
              ),
            ),
          ),
          Container(width: AppScreenSize.screenWidth(context), height: 1.h, color: AppColors.buttonColorCategory,),
          SizedBox(height: 20.h,),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichTextWidget(
                              text: arguments["suppliersData"].supplierName,
                              fontColor: AppColors.labelColor,
                              fontWeight: AppFontWeight.bold,
                              fontSize: 20.sp,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12.w,),
                      SvgPicture.asset(AppIconsPath.starIcon),
                      SizedBox(width: 4.w,),
                      SvgPicture.asset(AppIconsPath.starIcon),
                      SizedBox(width: 4.w,),
                      SvgPicture.asset(AppIconsPath.starIcon),
                      SizedBox(width: 4.w,),
                      SvgPicture.asset(AppIconsPath.starIcon),
                      SizedBox(width: 4.w,),
                      SvgPicture.asset(AppIconsPath.starIcon, color: AppColors.starUnselectedColor,),
                    ],
                  ),
                  SizedBox(height: 30.h,),
                  TabBarViewSupplierWidget(tabController: _tabController,),
                  SizedBox(height: 24.h,),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        CompanyHomeDataScreen(suppliersData: arguments["suppliersData"]),
                        const CompanyProductScreen(),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                          ],
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
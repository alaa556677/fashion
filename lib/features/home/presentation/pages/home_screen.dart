import 'package:fashion/features/home/presentation/pages/widgets/tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/enum_constants.dart';
import '../../../../core/constants/icons_path.dart';
import '../../../../core/constants/images_path.dart';
import '../../../../core/constants/navigate_methods.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/shared/cache_helper.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/button_default.dart';
import '../../../../core/widgets/search_text_form_field.dart';
import '../../../../core/widgets/text_default.dart';
import '../../../category/presentation/cubit/category_cubit.dart';
import '../../../products/presentation/cubit/products_cubit.dart';
import '../../../products/presentation/cubit/products_states.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_states.dart';
import 'products_home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();
  late TabController _tabController;
  late HomeCubit homeCubit;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      HomeCubit.instance.changeTabBarIndex(_tabController.index);
    });
    CategoryCubit.instance.getAllCategories();
    ProductsCubit.instance.getAllProducts();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    homeCubit = HomeCubit.instance;
    homeCubit.changeTabBarIndex(0);
    homeCubit.initDummy();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer< HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Image.asset(AppImagesPath.appLogoOnly, width: 60.w, height: 80.h,),
                // SvgPicture.asset(AppImagesPath.profileImage),
                SizedBox(width: 8.w,),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: 'Welcome',
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            fontColor: AppColors.textColor100,
                          ),
                          SizedBox(height: 4.h,),
                          TextWidget(
                            text: 'Nour Mohamed',
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            fontColor: AppColors.textColor100,
                          )
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(AppIconsPath.notificationIcon),
                          SizedBox(width: 8.w,),
                          SvgPicture.asset(AppIconsPath.menuIcons),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 22.h,),
            SearchTextForm(searchController: searchController,),
            SizedBox(height: 18.h,),
            TabBarViewBaseScreenWidget(tabController: _tabController,),
            SizedBox(height: 16.h,),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children:  const [
                  ProductsHomeScreen(),
                  CategoriesHomeScreen(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                    ],
                  ),
                ],
              ),
            ),

          ],
        );
      },
    );
  }
}

class CategoriesHomeScreen extends StatelessWidget {
  const CategoriesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsCubit, ProductsStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return state is GetCategoriesLoadingState
            ?  Center(child: Image.asset('assets/images/loading_icon.gif'))
            : SingleChildScrollView(
          child: Wrap(
            spacing: 12,
            runSpacing: 12,
            // alignment: WrapAlignment.center,
            children: CategoryCubit.instance.categoriesEntity!.data!.map((item){
              return Container(
                height: 120.h,
                // width: 140.w,
                decoration: BoxDecoration(
                  color: AppColors.buttonColorCategory,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                // padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w, vertical: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/product-preview.png',
                      width: MediaQuery.of(context).size.width *0.5,
                      height: 200.h,
                      fit: BoxFit.contain,
                    ),
                    TextWidget(
                      text: item.name ?? '',
                      fontColor: AppColors.textProductColor,
                      fontSize: 22.sp,
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
                            CacheHelper.saveData(key:Constants.addCategory.toString(),value: false);
                            CacheHelper.saveData(key:Constants.categoryId.toString(),value: item.id);
                            navigateToNamed(route: Routes.addCategoryScreen);
                          },
                          icon:  Icon(Icons.edit,color: AppColors.tabTextSelected,),
                        ),
                      ],
                    ),
                  ],
                ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Container(
                //       height: 80.h,
                //       decoration: BoxDecoration(
                //           image: DecorationImage(
                //             image: AssetImage('assets/images/product.png'),
                //           )
                //       ),
                //     ),
                //     SizedBox(height: 12.h,),
                //     TextWidget(
                //       text: item.name ?? '',
                //       fontColor: AppColors.textProductColor,
                //       fontSize: 18.sp,
                //       maxLines: 1,
                //       textOverflow: TextOverflow.ellipsis,
                //       fontWeight: FontWeight.w500,
                //     ),
                //     SizedBox(height: 4.h,),
                //     Row(
                //       children: [
                //        IconButton(
                //            onPressed: (){},
                //            icon:  Icon(Icons.edit),
                //        ),
                //         IconButton(
                //           onPressed: (){},
                //           icon:  Icon(Icons.delete),)
                //       ],
                //     ),
                //   ],
                // ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}

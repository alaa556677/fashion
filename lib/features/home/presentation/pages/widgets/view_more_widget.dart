import 'package:fashion/features/home/presentation/pages/widgets/product_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/constants_methods.dart';
import '../../../../../core/constants/navigate_methods.dart';
import '../../../../../core/constants/routes.dart';
import '../../../../../core/styles/colors.dart';
import '../../../../../core/widgets/text_default.dart';
import '../../../../products/presentation/pages/product_data_screen.dart';
import '../../../data/models/product_model.dart';

class ViewMoreWidget extends StatelessWidget{
  final String title;
  final List list;

  const ViewMoreWidget({
    super.key,
    required this.title,
    required this.list
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              text: title,
              fontColor: AppColors.textColorCategory,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
            TextWidget(
              text: 'View All',
              fontColor: AppColors.buttonColorAll,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              textDecoration: TextDecoration.underline,
              decorationColor: AppColors.buttonColorAll,
            )
          ],
        ),
        SizedBox(height: 18.h,),

        SizedBox(
          height: list.length > 2 ? 650.h : 300.h,
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount (
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 194/320
            ),
            itemBuilder: (context, index) => GestureDetector(
              onTap: (){
                navigateToNamed(route: Routes.productsDataScreen, arguments: {
                  "productDataModel" : list[index]
                });
              },
              child: ProductCard(
                productDataModel: list[index],
              ),
            ),
            itemCount: list.length,
          ),
        )
      ],
    );
  }
}



// Row(
//   children: [
//     const Expanded(
//       child: ProductCard(
//         imagePath: AppImagesPath.mobileImage,
//         productName: 'iPhone 14pro',
//         productDescription: 'New,Modern Ios System',
//         productPrice: '999.0',
//       ),
//     ),
//     SizedBox(width: 12.w,),
//     const Expanded(
//       child: ProductCard(
//         imagePath: AppImagesPath.mobileImage,
//         productName: 'iPhone 14pro',
//         productDescription: 'New,Modern Ios System',
//         productPrice: '999.0',
//       ),
//     ),
//   ],
// )
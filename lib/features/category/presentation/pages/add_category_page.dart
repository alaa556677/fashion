import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/constants/enum_constants.dart';
import '../../../../core/constants/navigate_methods.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/shared/cache_helper.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/button_default.dart';
import '../../../../core/widgets/default_text_form_field.dart';
import '../../../../core/widgets/screen_default.dart';
import '../../../../core/widgets/text_default.dart';
import '../cubit/category_cubit.dart';
import '../cubit/category_states.dart';

class AddCategoryPage extends StatelessWidget {
  AddCategoryPage({super.key});

  TextEditingController nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isAddCategory = CacheHelper.getData(key:Constants.addCategory.toString()) ?? true;
    int categoryId = CacheHelper.getData(key:Constants.categoryId.toString()) ?? 0;

    return BlocConsumer<CategoryCubit, CategoryStates>(
      listener: (context, state) {
        if(state is AddCategorySuccessState){
          Fluttertoast.showToast(msg: 'Category Added Successfully',backgroundColor: AppColors.tabTextSelected);
          navigateToAndRemoveNamed(route: Routes.baseScreen);
        }else if(state is UpdateCategorySuccessState){
          Fluttertoast.showToast(msg: 'Category Updated Successfully',backgroundColor: AppColors.tabTextSelected);
          navigateToAndRemoveNamed(route: Routes.baseScreen);
        }
      },
      builder: (context, state) {
        return DefaultScreen(
            backgroundColor: AppColors.whiteColor,
            // topPadding: 20.h,
            sizeAppbar: Size(double.infinity, 72.h),
            titleWidget: TextWidget(
              text: 'Categories',
              fontColor: AppColors.brush,
              fontSize: 16.sp,
            ),
            centerTitle: true,

            body: Column(
                children: [
              InputDecorator(
                  decoration: InputDecoration(
                    labelText: isAddCategory ? 'Add Category' : 'Update Category',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 18.h,
                        ),
                        TextWidget(
                          text: 'Name',
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        DefaultTextFormField(
                          hintText: 'Name',
                          filledColor: Colors.grey.withOpacity(0.3),
                          height: 44,
                          controller: nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "required Field";
                            }
                          },
                        ),
                        SizedBox(
                          height: 36.h,
                        ),
                        ButtonCustomWidget(
                            text: isAddCategory ? 'Add Category' : 'Update Category',
                            buttonColor: AppColors.tabTextSelected,
                            color: Colors.white,
                            buttonHeight: 42.h,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                isAddCategory ? CategoryCubit.instance
                                    .addCategory(name: nameController.text)
                                : CategoryCubit.instance.updateCategory(name: nameController.text,
                                    id: categoryId);
                              }
                            }),

                      ],
                    ),
                  ))
            ]));
      },
    );
  }
}

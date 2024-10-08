import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../core/constants/enum_constants.dart';
import '../../../../core/constants/navigate_methods.dart';
import '../../../../core/constants/routes.dart';
import '../../../../core/custom_drop_down_search.dart';
import '../../../../core/shared/cache_helper.dart';
import '../../../../core/styles/colors.dart';
import '../../../../core/widgets/button_default.dart';
import '../../../../core/widgets/default_text_form_field.dart';
import '../../../../core/widgets/screen_default.dart';
import '../../../../core/widgets/text_default.dart';
import '../cubit/products_cubit.dart';
import '../cubit/products_states.dart';

class AddProductPage extends StatefulWidget {
  AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController nameController = TextEditingController();

  TextEditingController priceController = TextEditingController();

  TextEditingController categoryController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController discountController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    ProductsCubit.instance.getAllCategories();
    super.initState();
  }
    bool? isError = false;
  @override
  Widget build(BuildContext context) {
    bool isAddProduct = CacheHelper.getData(key: Constants.addProduct.toString()) ?? true;
    int productId = CacheHelper.getData(key: Constants.productId.toString()) ?? 0;
    return BlocConsumer<ProductsCubit, ProductsStates>(
      listener: (context, state) {
        if(state is AddProductSuccessState){
          Fluttertoast.showToast(msg: 'Product Added Successfully',backgroundColor: AppColors.tabTextSelected);
          navigateToAndRemoveNamed(route: Routes.baseScreen);
        }else if(state is UpdateProductSuccessState){
          Fluttertoast.showToast(msg: 'Product Updated  Successfully',backgroundColor: AppColors.tabTextSelected);
          navigateToAndRemoveNamed(route: Routes.baseScreen);
        }else if (state is AddProductFailureState){
          if(state.message.contains('500') && ProductsCubit.instance.filePath == null ){
            Fluttertoast.showToast(msg: 'Please add an image',backgroundColor: Colors.red);
          }
        }else if (state is UpdateProductFailureState){
          if(state.message.contains('500') && ProductsCubit.instance.filePath == null ){
            Fluttertoast.showToast(msg: 'Please add an image',backgroundColor: Colors.red);
          }
        }
      },
      builder: (context, state) {
        return DefaultScreen(
          backgroundColor: AppColors.whiteColor,
          // topPadding: 20.h,
          sizeAppbar: Size(double.infinity, 72.h),
          titleWidget: TextWidget(
            text: 'Products',
            fontColor: AppColors.brush,
            fontSize: 16.sp,
          ),
          centerTitle: true,

          body:
          state is GetCategoriesLoadingState
              ? Center(child: Image.asset('assets/images/loading_icon.gif'))
          : SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h,),
                InputDecorator(
                  decoration: InputDecoration(
                    labelText: isAddProduct ?  'Add Product' : 'Update Product',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            ProductsCubit.instance.uploadImage();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: isError == true ? Colors.red :  AppColors.greyColor,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              child: Center(
                                child: ProductsCubit.instance.filePath == null
                                    ? Column(
                                  children: [
                                    Image.asset('assets/images/add_image.PNG'),
                                    SizedBox(height: 20.h,),
                                    TextWidget(
                                      text: 'Add Image',
                                    ),
                                  ],
                                ):Image.file(ProductsCubit.instance.filePath!,height: 320,),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 18.h,),
                        TextWidget(
                          text: 'Name',
                        ),
                        SizedBox(height: 12.h,),
                        DefaultTextFormField(
                          hintText: 'Name',
                          filledColor: Colors.grey.withOpacity(0.3),
                          height: 72,
                          validator: (value) {
                            if(value!.isEmpty) {
                              return "required Field";
                            }
                          },
                          controller: nameController,
                        ),
                        SizedBox(height: 6.h,),
                        TextWidget(
                          text: 'Price',
                        ),
                        SizedBox(height: 12.h,),
                        DefaultTextFormField(
                          hintText: 'Price',
                          filledColor: Colors.grey.withOpacity(0.3),
                          height: 72,
                          validator: (value) {
                            if(value!.isEmpty) {
                              return "required Field";
                            }
                          },
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          controller: priceController,
                        ),
                        SizedBox(height: 6.h,),
                        TextWidget(
                          text: 'Discount',
                        ),
                        SizedBox(height: 12.h,),
                        DefaultTextFormField(
                          hintText: 'Discount',
                          filledColor: Colors.grey.withOpacity(0.3),
                          height: 72,
                          validator: (value) {
                            if(value!.isEmpty) {
                              return "required Field";
                            }
                          },
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          controller: discountController,
                        ),
                        SizedBox(height: 6.h,),

                        TextWidget(
                          text: 'Category Id',
                        ),
                        SizedBox(height: 12.h,),
                        CustomDropDownSearch(
                          hintText: 'Products',
                          selectedItem: ProductsCubit.instance.selectedProductItem
                              ?? ProductsCubit.instance.categoriesEntity?.data?.first.name ?? ''  ,
                          items:  ProductsCubit.instance.categoriesEntity?.data,
                          enabled: true,
                          onChange: (val) {
                            ProductsCubit.instance.changeSelectedProduct(val);
                            setState(() {});
                          },
                          height: 56,
                        ),

                        SizedBox(height: 12.h,),
                        TextWidget(
                          text: 'Description',
                        ),
                        SizedBox(height: 12.h,),
                        DefaultTextFormField(
                          hintText: 'Description',
                          filledColor: Colors.grey.withOpacity(0.3),
                          height: 72,
                          validator: (value) {
                            if(value!.isEmpty) {
                              return "required Field";
                            }
                          },
                          controller: descriptionController,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 22.h,),
                ButtonCustomWidget(
                  text:  isAddProduct ?  'Add Product' : 'Update Product',
                  buttonColor: AppColors.tabTextSelected,
                  color: Colors.white,
                  buttonHeight: 42.h,
                  onPressed: (){
                    if (formKey.currentState!.validate()) {
                      isAddProduct ? ProductsCubit.instance.addProduct(
                        name: nameController.text,
                        price: double.tryParse(priceController.text)!,
                        description: descriptionController.text,
                        discount:double.tryParse(discountController.text)!,
                        categoryId:  ProductsCubit.instance.selectedProductItem != null
                            ? ProductsCubit.instance.selectedProductItem!.id!.toInt()
                            : ProductsCubit.instance.categoriesEntity!.data != null
                            ? ProductsCubit.instance.categoriesEntity!.data!.first.id!.toInt()
                        :0,
                        image: ProductsCubit.instance.filePath == null
                            ? File("")
                            : ProductsCubit.instance.filePath!,
                        isImageExist: ProductsCubit.instance.filePath == null ? false : true,
                        imageByte:  ProductsCubit.instance.filePath == null ? Uint8List(10) : ProductsCubit.instance.imageByte,
                      ):ProductsCubit.instance.updateProduct(
                        id: productId,
                        name: nameController.text,
                        price: double.tryParse(priceController.text)!,
                        description: descriptionController.text,
                        discount:double.tryParse(discountController.text)!,
                        categoryId:  ProductsCubit.instance.selectedProductItem != null
                            ? ProductsCubit.instance.selectedProductItem!.id!.toInt()
                            : ProductsCubit.instance.categoriesEntity!.data != null
                            ? ProductsCubit.instance.categoriesEntity!.data!.first.id!.toInt()
                            :0,
                        image: ProductsCubit.instance.filePath == null
                            ? File("")
                            : ProductsCubit.instance.filePath!,
                        isImageExist: ProductsCubit.instance.filePath == null ? false : true,
                        imageByte:  ProductsCubit.instance.filePath == null ? Uint8List(10) : ProductsCubit.instance.imageByte,
                      );;
                      setState(() {
                        isError = ProductsCubit.instance.filePath == null ? true : false;
                      });
                    }
                  },
                ),
                SizedBox(height: 22.h,),

              ],
            ),
          ),
        );
      },
    );
  }
}

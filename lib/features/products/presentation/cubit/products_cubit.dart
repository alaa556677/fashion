import 'dart:convert';
import 'dart:io';
import 'package:fashion/features/products/presentation/cubit/products_states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../main.dart';
import '../../../category/data/model/CategoriesModel.dart';
import '../../../category/domain/entity/categories_entity.dart';
import '../../../category/domain/use_cases/categories_use_case.dart';
import '../../domain/entity/all_products_entity.dart';
import '../../domain/use_cases/add_product_use_case.dart';
import '../../domain/use_cases/all_products_use_case.dart';
import '../../domain/use_cases/delete_product_use_case.dart';
import '../../domain/use_cases/update_product_use_case.dart';

class ProductsCubit extends Cubit <ProductsStates>{
  ProductsCubit(this.addProductUseCase,this.allCategoriesUseCase,
      this.updateProductUseCase,this.deleteProductUseCase,this.allProductUseCase) : super(InitialProductsState());
  static final ProductsCubit _productsCubit = BlocProvider.of<ProductsCubit>(navigatorKey.currentState!.context);
  static ProductsCubit get instance => _productsCubit;
////////////////////////////////////////////////////////////////////////////////

  AddProductUseCase addProductUseCase;

  addProduct({
    required String name,
    required double price ,
    required String description ,
    required double discount ,
    required int categoryId ,
    required File image,
    dynamic imageByte,
    required bool isImageExist,
  }) async {
    emit(AddProductLoadingState());
    final result = await addProductUseCase(name, price, description, discount,categoryId,image,imageByte,isImageExist);
    result.fold((failure) {
      emit(AddProductFailureState(failure.errorMessage));
    }, (addProduct) {
      if (addProduct.isSuccess == true) {
        emit(AddProductSuccessState());
      } else {
        emit(AddProductErrorState(addProduct.errors!.first.message!));
      }
    });
  }
////////////////////////////////////////////////////////////////////////////////
  File? filePath;
  var imagePicker = ImagePicker();
  String? base64;
  Uint8List? imageByte;
  var imageForNetwork;

  uploadImage() async {
    emit(UploadImageLoading());
    try {
      final XFile? imgPicked = await imagePicker.pickImage(source: ImageSource.gallery, );
      if (imgPicked != null) {
        filePath = File(imgPicked.path);
        print('file ${imgPicked.path}');
        imageByte = await imgPicked.readAsBytes();
        imageForNetwork = imgPicked.path;
        base64 = base64Encode(imageByte!);
      }
      emit(UploadImageSuccess());
    } catch (e) {
      if (kDebugMode) {
        print('error is $e');
      }
      emit(UploadImageError());
    }
  }
  ////////////////////////////////////////////////////////////////////////////////
  AllCategoriesUseCase allCategoriesUseCase;
  CategoriesEntity? categoriesEntity;

  getAllCategories() async {
    emit(GetCategoriesLoadingState());
    final result = await allCategoriesUseCase();
    result.fold((failure) {
      emit(GetCategoriesFailureState());
    },(category) {
      if (category.isSuccess == true) {
        categoriesEntity = category;
        emit(GetCategoriesSuccessState());
      } else {
        emit(GetCategoriesErrorState());
      }
    });
  }

  CategoriesData? selectedProductItem;
  changeSelectedProduct(value) {
    selectedProductItem = value;
    emit(ChangeSelectProduct());
  }
////////////////////////////////////////////////////////////////////////////////

  UpdateProductUseCase updateProductUseCase;

  updateProduct({
    required int id,
    required String name,
    required double price ,
    required String description ,
    required double discount ,
    required int categoryId ,
    required File image,
    dynamic imageByte,
    required bool isImageExist,
  }) async {
    emit(UpdateProductLoadingState());
    final result = await updateProductUseCase(id,name, price, description, discount,categoryId,image,imageByte,isImageExist);
    result.fold((failure) {
      emit(UpdateProductFailureState(failure.errorMessage));
    }, (update) {
      if (update.isSuccess == true) {
        emit(UpdateProductSuccessState());
      } else {
        emit(UpdateProductErrorState(update.errors!.first.message!));
      }
    });
  }
////////////////////////////////////////////////////////////////////////////////
  DeleteProductUseCase deleteProductUseCase;

  deleteProduct({required int id}) async {
    emit(DeleteProductLoadingState());
    final result = await deleteProductUseCase(id);
    result.fold((failure) {
      emit(DeleteProductFailureState(failure.errorMessage));
    },(delete) {
      if (delete.isSuccess == true) {
        emit(DeleteProductSuccessState());
      } else {
        emit(DeleteProductErrorState(delete.errors!.first.message!));
      }
    });
  }
  ////////////////////////////////////////////////////////////////////////////////

  AllProductUseCase allProductUseCase;
  AllProductsEntity? allProductsEntity;

  getAllProducts() async {
    emit(GetProductLoadingState());
    final result = await allProductUseCase();
    result.fold((failure) {
      emit(GetProductFailureState(failure.errorMessage));
    },(product) {
      if (product.isSuccess == true) {
        allProductsEntity = product;
        emit(GetProductSuccessState());
      } else {
        emit(GetProductErrorState(product.errors!.first.message!));
      }
    });
  }
}
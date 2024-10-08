import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/constants/failure.dart';
import '../../domain/entity/add_category_entity.dart';
import '../../domain/entity/all_products_entity.dart';
import '../../domain/entity/delete_product_entity.dart';
import '../../domain/entity/update_product_entity.dart';
import '../../domain/repository/product_repository.dart';
import '../data_source/add_product_data_source.dart';
import '../data_source/all_products_data_source.dart';
import '../data_source/delete_product_data_source.dart';
import '../data_source/update_product_data_source.dart';

class ProductRepoImpl implements ProductRepo{

  ProductRepoImpl(this.addProductDataSource,this.updateProductDataSource,
      this.deleteProductDataSource,this.allProductDataSource);

  AddProductDataSource addProductDataSource;
  UpdateProductDataSource updateProductDataSource;
  DeleteProductDataSource deleteProductDataSource;
  AllProductDataSource allProductDataSource;

  @override
  Future<Either<Failure, AddProductEntity>> addProduct(String name, double price, String description, double discount, int categoryId, File image, imageByte, bool isImageExist) async{
    try {
      return Right(await addProductDataSource.addCategory(name,price,description, discount,categoryId,image,imageByte,isImageExist));
    } catch (e) {
    print(e.toString());
    return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UpdateProductEntity>> updateProduct(int id , String name, double price, String description, double discount, int categoryId, File image, imageByte, bool isImageExist) async{
    try {
      return Right(await updateProductDataSource.updateCategory(id ,name,price,description, discount,categoryId,image,imageByte,isImageExist));
    } catch (e) {
      print(e.toString());
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DeleteProductEntity>> deleteProduct(int id)async {
    try {
      return Right(await deleteProductDataSource.deleteCategory(id));
    } catch (e) {
    print(e.toString());
    return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AllProductsEntity>> getAllProducts()async {
    try {
      return Right(await allProductDataSource.getAllCategories());
    } catch (e) {
    print(e.toString());
    return Left(Failure(e.toString()));
    }
  }

}
import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/constants/failure.dart';
import '../entity/add_category_entity.dart';
import '../entity/all_products_entity.dart';
import '../entity/delete_product_entity.dart';
import '../entity/update_product_entity.dart';

abstract class ProductRepo{
  Future<Either<Failure,AddProductEntity>> addProduct(String name,double price , String description , double discount , int categoryId , File image,dynamic imageByte,bool isImageExist,);
  Future<Either<Failure,UpdateProductEntity>> updateProduct(int id,String name,double price , String description , double discount , int categoryId , File image,dynamic imageByte,bool isImageExist,);
  Future<Either<Failure,DeleteProductEntity>> deleteProduct(int id);
  Future<Either<Failure,AllProductsEntity>> getAllProducts();

}
import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/constants/failure.dart';
import '../entity/update_product_entity.dart';
import '../repository/product_repository.dart';

class UpdateProductUseCase{
  final ProductRepo repository;

  UpdateProductUseCase(this.repository);

  Future<Either<Failure, UpdateProductEntity>> call(
      int id,String name,double price , String description , double discount , int categoryId , File image,dynamic imageByte,bool isImageExist,
      ) async {
    return await repository.updateProduct(id ,name, price, description, discount,categoryId,image,imageByte,isImageExist);
  }
}


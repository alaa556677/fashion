import 'dart:io';
import 'package:dartz/dartz.dart';

import '../../../../core/constants/failure.dart';
import '../entity/add_category_entity.dart';
import '../repository/product_repository.dart';

class AddProductUseCase{
  final ProductRepo repository;

  AddProductUseCase(this.repository);

  Future<Either<Failure, AddProductEntity>> call(
      String name,double price , String description , double discount , int categoryId , File image,dynamic imageByte,bool isImageExist,
      ) async {
    return await repository.addProduct(name, price, description, discount,categoryId,image,imageByte,isImageExist);
  }
}


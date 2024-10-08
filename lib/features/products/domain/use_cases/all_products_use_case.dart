import 'package:dartz/dartz.dart';
import '../../../../core/constants/failure.dart';
import '../entity/all_products_entity.dart';
import '../repository/product_repository.dart';

class AllProductUseCase{
  final ProductRepo repository;

  AllProductUseCase(this.repository);

  Future<Either<Failure, AllProductsEntity>> call() async {
    return await repository.getAllProducts();
  }
}


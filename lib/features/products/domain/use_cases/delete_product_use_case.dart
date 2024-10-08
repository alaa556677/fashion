import 'package:dartz/dartz.dart';
import '../../../../core/constants/failure.dart';
import '../entity/delete_product_entity.dart';
import '../repository/product_repository.dart';

class DeleteProductUseCase{
  final ProductRepo repository;

  DeleteProductUseCase(this.repository);

  Future<Either<Failure, DeleteProductEntity>> call(
      int id
      ) async {
    return await repository.deleteProduct(id);
  }
}


import 'package:dartz/dartz.dart';
import '../../../../core/constants/failure.dart';
import '../entity/delete_category_entity.dart';
import '../repository/category_repository.dart';

class DeleteCategoryUseCase{
  final CategoryRepo repository;

  DeleteCategoryUseCase(this.repository);

  Future<Either<Failure, DeleteCategoryEntity>> call(
      int id
      ) async {
    return await repository.deleteCategory(id);
  }
}


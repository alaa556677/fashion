import 'package:dartz/dartz.dart';
import '../../../../core/constants/failure.dart';
import '../entity/categories_entity.dart';
import '../repository/category_repository.dart';

class AllCategoriesUseCase{
  final CategoryRepo repository;

  AllCategoriesUseCase(this.repository);

  Future<Either<Failure, CategoriesEntity>> call() async {
    return await repository.getAllCategories();
  }
}


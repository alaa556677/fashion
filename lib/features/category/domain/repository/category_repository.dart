import 'package:dartz/dartz.dart';
import '../../../../core/constants/failure.dart';
import '../entity/add_category_entity.dart';
import '../entity/categories_entity.dart';
import '../entity/delete_category_entity.dart';
import '../entity/update_category_entity.dart';

abstract class CategoryRepo{
  Future<Either<Failure,AddCategoryEntity>> addCategory(String name,);
  Future<Either<Failure,CategoriesEntity>> getAllCategories();
  Future<Either<Failure,UpdateCategoryEntity>> updateCategory(String name, int id);
  Future<Either<Failure,DeleteCategoryEntity>> deleteCategory(int id);

}
import 'package:fashion/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:fashion/features/category/presentation/cubit/category_cubit.dart';
import 'package:fashion/features/onBoarding/presentation/cubit/onBoarding_cubit.dart';
import '../../locator.dart';
import 'data/data_source/add_category_data_source.dart';
import 'data/data_source/categories_data_source.dart';
import 'data/data_source/delete_category_data_source.dart';
import 'data/data_source/update_category_data_source.dart';
import 'data/repository/category_repository_impl.dart';
import 'domain/repository/category_repository.dart';
import 'domain/use_cases/add_category_use_case.dart';
import 'domain/use_cases/categories_use_case.dart';
import 'domain/use_cases/delete_category_use_case.dart';
import 'domain/use_cases/update_category_use_case.dart';

initCategoryInjection(){
  locator.registerFactory(() => CategoryCubit(locator(), locator(), locator(), locator()));
////////////////////////////////////////////////////////////////////////////////
  locator.registerLazySingleton<AddCategoryDataSource>(() => AddCategoryDataSource());
  locator.registerLazySingleton<AllCategoriesDataSource>(() => AllCategoriesDataSource());
  locator.registerLazySingleton<DeleteCategoryDataSource>(() => DeleteCategoryDataSource());
  locator.registerLazySingleton<UpdateCategoryDataSource>(() => UpdateCategoryDataSource());
////////////////////////////////////////////////////////////////////////////////
  locator.registerLazySingleton<AddCategoryUseCase>(() => AddCategoryUseCase(locator(),));
  locator.registerLazySingleton<AllCategoriesUseCase>(() => AllCategoriesUseCase(locator(),));
  locator.registerLazySingleton<DeleteCategoryUseCase>(() => DeleteCategoryUseCase(locator(),));
  locator.registerLazySingleton<UpdateCategoryUseCase>(() => UpdateCategoryUseCase(locator(),));
////////////////////////////////////////////////////////////////////////////////
  locator.registerLazySingleton<CategoryRepo>(() => CategoryRepoImpl(locator(),locator(), locator(), locator()));
}
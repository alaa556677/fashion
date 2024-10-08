import 'package:fashion/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:fashion/features/onBoarding/presentation/cubit/onBoarding_cubit.dart';
import 'package:fashion/features/products/presentation/cubit/products_cubit.dart';
import '../../locator.dart';
import 'data/data_source/add_product_data_source.dart';
import 'data/data_source/all_products_data_source.dart';
import 'data/data_source/delete_product_data_source.dart';
import 'data/data_source/update_product_data_source.dart';
import 'data/repository/product_repository_impl.dart';
import 'domain/repository/product_repository.dart';
import 'domain/use_cases/add_product_use_case.dart';
import 'domain/use_cases/all_products_use_case.dart';
import 'domain/use_cases/delete_product_use_case.dart';
import 'domain/use_cases/update_product_use_case.dart';

initProductInjection(){
  locator.registerFactory(() => ProductsCubit(locator(), locator(), locator(), locator(), locator()));
////////////////////////////////////////////////////////////////////////////////
  locator.registerLazySingleton<AddProductDataSource>(() => AddProductDataSource());
  locator.registerLazySingleton<AllProductDataSource>(() => AllProductDataSource());
  locator.registerLazySingleton<DeleteProductDataSource>(() => DeleteProductDataSource());
  locator.registerLazySingleton<UpdateProductDataSource>(() => UpdateProductDataSource());
////////////////////////////////////////////////////////////////////////////////
  locator.registerLazySingleton<AddProductUseCase>(() => AddProductUseCase(locator(),));
  locator.registerLazySingleton<AllProductUseCase>(() => AllProductUseCase(locator(),));
  locator.registerLazySingleton<DeleteProductUseCase>(() => DeleteProductUseCase(locator(),));
  locator.registerLazySingleton<UpdateProductUseCase>(() => UpdateProductUseCase(locator(),));
////////////////////////////////////////////////////////////////////////////////
  locator.registerLazySingleton<ProductRepo>(() => ProductRepoImpl(locator(),locator(), locator(), locator()));
}
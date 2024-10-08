import 'package:get_it/get_it.dart';
import 'features/auth/auth_injection.dart';
import 'features/base_screen/base_injection.dart';
import 'features/category/category_injection.dart';
import 'features/home/home_injection.dart';
import 'features/onBoarding/onboarding_injection.dart';
import 'features/products/product_injection.dart';

final locator = GetIt.instance;
void setup(){
  initOnBoardingInjection();
  initAuthInjection();
  initBaseInjection();
  initCategoryInjection();
  initHomeInjection();
  initProductInjection();
}
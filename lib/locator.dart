import 'package:get_it/get_it.dart';
import 'features/auth/auth_injection.dart';
import 'features/onBoarding/onboarding_injection.dart';

final locator = GetIt.instance;
void setup(){
  initOnBoardingInjection();
  initAuthInjection();
}
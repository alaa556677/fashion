import 'package:fashion/features/onBoarding/presentation/cubit/onBoarding_cubit.dart';
import '../../locator.dart';

initOnBoardingInjection(){
  locator.registerFactory(() => OnBoardingCubit());
////////////////////////////////////////////////////////////////////////////////
}
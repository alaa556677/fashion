import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/constants/bloc_observer.dart';
import 'core/constants/routes.dart';
import 'core/shared/cache_helper.dart';
import 'core/shared/dio_helper.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';
import 'features/auth/presentation/pages/login_screen.dart';
import 'features/auth/presentation/pages/register_screen.dart';
import 'features/onBoarding/presentation/cubit/onBoarding_cubit.dart';
import 'features/onBoarding/presentation/pages/OnBoarding_screen.dart';
import 'features/onBoarding/presentation/pages/splash_screen.dart';
import 'locator.dart'as di;

final navigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<ScaffoldMessengerState> snackBarKey = GlobalKey<ScaffoldMessengerState>();
BuildContext currentContext = navigatorKey.currentContext!;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  di.setup();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size (375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider<OnBoardingCubit>(create: (_) =>di.locator<OnBoardingCubit>(),),
            BlocProvider<AuthCubit>(create: (_) => di.locator<AuthCubit>(),),
          ],
          child: MaterialApp(
            navigatorKey: navigatorKey,
            scaffoldMessengerKey: snackBarKey,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: (settings){
              Widget? wid;
              switch (settings.name) {
                case Routes.splashScreen:
                  wid = const SplashScreen();
                  break;
                case Routes.onBoardingScreen:
                  wid = const OnBoardingScreen();
                  break;
                case Routes.login:
                  wid = LoginScreen();
                  break;
                case Routes.register:
                  wid =  const RegisterScreen();
                  break;
                // case Routes.baseScreen:
                //   wid = const BaseScreen();
                //   break;
                // case Routes.chatScreen:
                //   wid = const ChatScreen();
                //   break;
                // case Routes.companyDataScreen:
                //   wid = const CompanyDataScreen();
                //   break;
                // case Routes.productsDataScreen:
                //   wid = const ProductsDataScreen();
                //   break;
                // case Routes.homeScreen:
                //   wid = const HomeScreen();
                //   break;
                // case Routes.addProductScreen:
                //   wid =  AddProductPage();
                //   break;
                // case Routes.addCategoryScreen:
                //   wid = AddCategoryPage();
                //   break;
              }
              if (wid != null) {
                return PageRouteBuilder(
                    settings: settings,
                    // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
                    pageBuilder: (_, __, ___) => wid!,
                    transitionsBuilder: (_, a, __, c) =>
                        FadeTransition(opacity: a, child: c));
              }
              return null;
            },
            navigatorObservers: [RouteObserver<PageRoute>()],
            initialRoute: Routes.splashScreen,
          ),
        );
      },
    );
  }
}

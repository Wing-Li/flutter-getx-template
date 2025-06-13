import 'package:flutter_getx_template/pages/login/login_binding.dart';
import 'package:flutter_getx_template/pages/login/login_view.dart';
import 'package:flutter_getx_template/pages/main/main_binding.dart';
import 'package:flutter_getx_template/pages/main/main_view.dart';
import 'package:flutter_getx_template/pages/notfound/notfound_view.dart';
import 'package:flutter_getx_template/pages/splash/splash_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Splash;

  static final routes = [
    GetPage(
      name: AppRoutes.Splash,
      page: () => SplashPage(),
    ),
    GetPage(
      name: AppRoutes.Login,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.Main,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
  ];

  static final unknownRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => NotfoundPage(),
  );
}

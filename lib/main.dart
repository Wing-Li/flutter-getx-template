import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_template/common/langs/translation_service.dart';
import 'package:flutter_getx_template/global.dart';
import 'package:flutter_getx_template/pages/splash/splash_binding.dart';
import 'package:flutter_getx_template/pages/splash/splash_view.dart';
import 'package:flutter_getx_template/res/my_theme.dart';
import 'package:flutter_getx_template/router/app_pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'services/app_service.dart';

void main() => Global.init().then((e) => runApp(MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'App'.tr,
          // 隐藏debug标签
          debugShowCheckedModeBanner: false,
          // 日志
          enableLog: true,
          // 初始页面
          home: SplashPage(),
          initialBinding: SplashBinding(),
          // 路由
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          unknownRoute: AppPages.unknownRoute,
          // Toast
          builder: BotToastInit(),
          navigatorObservers: [
            BotToastNavigatorObserver(),
            RouteObserver(),
          ],
          // 多语言
          translations: TranslationService(),
          // 翻译服务
          locale: TranslationService.locale,
          // 默认语言
          fallbackLocale: TranslationService.fallbackLocale,
          // 主题
          themeMode: ThemeMode.light,
          darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: MyTheme.bg_page,
            primaryColor: MyTheme.primaryText,
            appBarTheme: AppBarTheme(
              backgroundColor: MyTheme.white,
              foregroundColor: MyTheme.block,
              elevation: 0, // 隐藏阴影
            ),
          ),
        );
      },
      child: SplashPage(),
    );
  }
}

/// 自定义中间件记录路由栈
class RouteObserver extends GetObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    if (route.settings.name != null) {
      AppService.to.addRoute(route);
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    if (route.settings.name != null) {
      AppService.to.removeRoute(route);
    }
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    if (route.settings.name != null) {
      AppService.to.removeRoute(route); // 这会被执行
    }
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    if (oldRoute?.settings.name != null) {
      AppService.to.removeRoute(oldRoute!);
    }
    if (newRoute?.settings.name != null) {
      AppService.to.addRoute(newRoute!);
    }
  }
}

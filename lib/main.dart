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
          title: 'zappy'.tr,
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
          navigatorObservers: [BotToastNavigatorObserver()],
          // 多语言
          translations: TranslationService(), // 翻译服务
          locale: TranslationService.locale, // 默认语言
          fallbackLocale: TranslationService.fallbackLocale, // 备用语言
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

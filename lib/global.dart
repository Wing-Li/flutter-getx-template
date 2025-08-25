import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_template/common/my_constants.dart';
import 'package:flutter_getx_template/utils/http_utils.dart';
import 'package:flutter_getx_template/utils/sp_utils.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import 'services/app_service.dart';
import 'services/user_service.dart';

/// 全局配置
class Global {
  /// 是否第一次打开
  static bool isFirstOpen = false;

  /// 是否 release
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  /// init
  static Future init() async {
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();

    Loggy.initLoggy();

    // Ruquest 模块初始化
    HttpUtils();
    // 本地存储初始化
    await SpUtils.getInstance();

    // 初始化用户服务
    await Get.putAsync(() async => AppService());
    await Get.putAsync(() async => UserService());

    // 读取设备第一次打开
    isFirstOpen = !SpUtils.getBool(MyConstants.STORAGE_DEVICE_ALREADY_OPEN_KEY);
    if (isFirstOpen) {
      SpUtils.putBool(MyConstants.STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
    }

    // android 状态栏为透明的沉浸
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark, // 状态栏文字颜色
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}

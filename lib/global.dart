import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_template/common/my_constants.dart';
import 'package:flutter_getx_template/utils/http_utils.dart';
import 'package:flutter_getx_template/utils/sp_utils.dart';
import 'package:loggy/loggy.dart';

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

    // 极光推送初始化
    // await PushManager.setup();

    // 语音播报初始化
    // await TtsManager.setup();

    // 高德地图初始化
    // await AmapService.instance.init(
    //   iosKey: 'xxxx',
    //   androidKey: 'xxxx',
    // );

    // 读取设备第一次打开
    isFirstOpen = !SpUtils.getBool(MyConstants.STORAGE_DEVICE_ALREADY_OPEN_KEY);
    if (isFirstOpen) {
      SpUtils.putBool(MyConstants.STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
    }

    // android 状态栏为透明的沉浸
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}

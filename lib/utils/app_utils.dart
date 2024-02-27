import 'package:package_info_plus/package_info_plus.dart';

class AppUtils {
  /// 获取当前程序的版本号
  static Future<String> getAppVersionName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  /// 获取当前程序的包名
  static Future<String> getAppPackageName() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.packageName;
  }
}

import 'package:permission_handler/permission_handler.dart';

class PermissionUtils {

  static Future<bool> isHasPermissionStorage() async {
    return await Permission.storage.status.isGranted;
  }

  static Future<bool> requestPermissionStorage() async {
    return await Permission.storage.request().isGranted;
  }

  static Future<bool> openPermissionSettings() async {
    return openAppSettings();
  }
}

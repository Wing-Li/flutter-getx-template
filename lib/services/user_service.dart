import 'dart:convert';

import 'package:flutter_getx_template/net/data/user_info.dart';
import 'package:flutter_getx_template/net/user_api.dart';
import 'package:flutter_getx_template/router/app_pages.dart';
import 'package:flutter_getx_template/utils/sheet/my_sheet_utils.dart';
import 'package:flutter_getx_template/utils/sp_utils.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../utils/my_utils.dart';

/// 用户服务，管理用户信息和状态
class UserService extends GetxService {
  static UserService get to => Get.find();

  // 本地存储键名
  static const String _keyUserInfo = 'key_user_info';
  static const String _keyDeviceId = 'key_device_id';
  static const String _keyLastLoginTime = 'key_last_login_time';

  // 当前用户信息
  final Rx<UserInfo?> currentUser = Rx<UserInfo?>(null);

  // 计算属性
  bool get isLoggedIn => currentUser.value?.account != null;

  String? get token => currentUser.value?.authToken;

  Account? get account => currentUser.value?.account;

  // Token过期检查（简单实现，可根据实际需求调整）
  // bool get isTokenExpired {
  //   final token = currentUser.value?.authToken;
  //   if (token == null) return true;
  //
  //   final lastLoginTime = SpUtils.getInt(_keyLastLoginTime) ?? 0;
  //   final now = DateTime.now().millisecondsSinceEpoch;
  //   // Token有效期30天
  //   const tokenValidityDuration = 30 * 24 * 60 * 60 * 1000;
  //
  //   return (now - lastLoginTime) > tokenValidityDuration;
  // }

  /// 初始化用户服务
  @override
  Future<UserService> onInit() async {
    super.onInit();

    await _loadUserFromLocal();
    await fetchUserProfile();

    return this;
  }

  /// 从本地加载用户信息
  Future<void> _loadUserFromLocal() async {
    try {
      final userInfoJson = SpUtils.getString(_keyUserInfo);

      if (userInfoJson != null && userInfoJson.isNotEmpty) {
        final userInfoMap = jsonDecode(userInfoJson);
        final userInfo = UserInfo.fromJson(userInfoMap);
        if (userInfo.account == null || userInfo.authToken == null) {
          currentUser.value = null;
          MyUtils.log('从本地加载用户信息为 null');
        } else {
          currentUser.value = userInfo;
          MyUtils.log('从本地加载用户信息成功: ${account?.nickname}');
        }
      }
    } catch (e) {
      MyUtils.log('从本地加载用户信息失败: $e');
      await _clearLocalUserData();
    }
  }

  /// 保存用户信息到本地
  Future<void> saveUserToLocal(UserInfo userInfo) async {
    currentUser.value = userInfo;

    await SpUtils.putString(_keyUserInfo, jsonEncode(userInfo.toJson()));

    // 保存登录时间
    await SpUtils.putInt(_keyLastLoginTime, DateTime.now().millisecondsSinceEpoch);

    MyUtils.log('用户信息保存到本地成功');
  }

  /// 清除本地用户数据
  Future<void> _clearLocalUserData() async {
    currentUser.value = null;

    await SpUtils.remove(_keyUserInfo);
    await SpUtils.remove(_keyLastLoginTime);
  }

  /// 刷新用户资料
  Future<bool> fetchUserProfile() async {
    if (!isLoggedIn) return false;

    try {
      // final response = await UserAPI.getUserInfo();
      //
      // if (response.code == 200 && response.data != null) {
      //   // 保持原有的token
      //   final oldToken = currentUser.value?.authToken;
      //   // 更新用户信息
      //   currentUser.value = response.data;
      //   if (MyUtils.isEmpty(response.data?.authToken) && !MyUtils.isEmpty(oldToken)) {
      //     currentUser.value!.authToken = oldToken;
      //   }
      //
      //   await saveUserToLocal(currentUser.value!);
      //   MyUtils.log('用户资料刷新成功');
      //   return true;
      // } else {
      //   MyUtils.log('刷新用户资料失败: 错误码 ${response.code}');
      //   return false;
      // }

      return true;
    } catch (e) {
      MyUtils.log('刷新用户资料异常: $e');
      return false;
    }
  }

  /// 退出登录
  Future<void> logout() async {
    currentUser.value = null;
    await _clearLocalUserData();

    MyUtils.log('用户已退出登录');
  }

  /// 获取设备ID
  String getDeviceId() {
    String deviceId = SpUtils.getString(_keyDeviceId) ?? "";
    if (deviceId.isEmpty) {
      deviceId = const Uuid().v4();
      SpUtils.putString(_keyDeviceId, deviceId);
    }
    return deviceId;
  }

  /// 检查是否需要更新资料
  bool needsProfileUpdate() {
    final user = account;
    if (user == null) return false;

    return user.completed == 0;
  }

  /// 检查用户是否登录，若未登录，则跳转到登录页面
  bool checkAndLogin() {
    if (!isLoggedIn) {
      MySheetUtils.showConfirmSheet(
        title: "Please log in to continue.",
        confirmText: "Login in",
        onConfirm: () {
          Get.toNamed(AppRoutes.Login);
        },
      );
      return false;
    }
    return true;
  }
}

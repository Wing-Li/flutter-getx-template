import 'package:flutter_getx_template/net/data/user_info.dart';
import 'base_api.dart';
import 'data/base_response.dart';

/// 用户
class UserAPI {
  /// 登录
  static Future<BaseResponse<UserInfo>> login(String username, String password) async {
    Map<String, dynamic> params = {
      "username": username,
      "password": password,
    };
    return BaseApi.post<UserInfo>(
      '/login/',
      params: params,
      fromJson: UserInfo.fromJson,
    );
  }
}

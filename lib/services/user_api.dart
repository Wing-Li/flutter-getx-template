import 'package:flutter_getx_template/pages/login/login_model.dart';
import 'package:flutter_getx_template/utils/http_utils.dart';

/// 用户
class UserAPI {
  /// 登录
  static Future<UserLoginResponseModel> login({
    required Map params,
  }) async {
    var response = await HttpUtils().post(
      '/login/',
      params: params,
    );
    return UserLoginResponseModel.fromJson(response['data']);
  }
}
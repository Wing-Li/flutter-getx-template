import 'package:flutter_getx_template/net/data/user_info_rep.dart';
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

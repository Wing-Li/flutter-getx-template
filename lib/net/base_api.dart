import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_getx_template/utils/http_utils.dart';

import 'data/base_response.dart';

class BaseApi {
  static HttpUtils _http = HttpUtils();

  /// 通用GET请求
  static Future<BaseResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    var response = await _http.get(
      path,
      params: params,
      options: options,
    );

    return BaseResponse<T>.fromJson(response, fromJson);
  }

  /// 通用POST请求
  static Future<BaseResponse<T>> post<T>(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    var response = await _http.post(
      path,
      params: {
        "data": params,
      },
      options: options,
    );

    return BaseResponse<T>.fromJson(response, fromJson);
  }

  /// 通用PUT请求
  static Future<BaseResponse<T>> put<T>(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    var response = await _http.put(
      path,
      params: params,
      options: options,
    );

    return BaseResponse<T>.fromJson(response, fromJson);
  }

  /// 通用DELETE请求
  static Future<BaseResponse<T>> delete<T>(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    var response = await _http.delete(
      path,
      params: params,
      options: options,
    );

    return BaseResponse<T>.fromJson(response, fromJson);
  }

  /// 通用表单提交
  static Future<BaseResponse<T>> postForm<T>(
    String path, {
    Map<String, dynamic>? params,
    Options? options,
    required T Function(Map<String, dynamic>) fromJson,
  }) async {
    var response = await _http.postForm(
      path,
      params: params,
      options: options,
    );

    return BaseResponse<T>.fromJson(response, fromJson);
  }
}

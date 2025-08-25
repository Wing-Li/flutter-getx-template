import 'dart:convert';

class BaseResponse<T> {
  int code;
  T? data;
  String? errorMsg;

  BaseResponse({
    required this.code,
    this.data,
    this.errorMsg,
  });

  factory BaseResponse.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return BaseResponse<T>(
      code: json["code"],
      data: json["data"] != null ? fromJsonT(json["data"]) : null,
      errorMsg: json["error_msg"] != null ? json["error_msg"] as String : null,
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> Function(T) toJsonT) => {
        "code": code,
        "data": data != null ? toJsonT(data!) : null,
        "error_msg": errorMsg != null ? errorMsg! : null,
      };
}

BaseResponse<T> baseResponseFromJson<T>(
        String str, T Function(Map<String, dynamic>) fromJsonT) =>
    BaseResponse<T>.fromJson(json.decode(str), fromJsonT);

String baseResponseToJson<T>(
        BaseResponse<T> data, Map<String, dynamic> Function(T) toJsonT) =>
    json.encode(data.toJson(toJsonT));

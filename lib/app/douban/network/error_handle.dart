import 'dart:io';

import 'package:dio/dio.dart';

class ExceptionHandle {
  static const success = 200;
  static const not_found_code = 404;
  static const unauthorized = 401;
  static const int forbidden = 403;

  static const int net_error = -1;
  static const int parse_error = -1;
  static const int socket_error = -1;
  static const int http_error = -1;
  static const int connect_timeout_error = -1;
  static const int send_timeout_error = -1;
  static const int receive_timeout_error = -1;
  static const int cancel_error = -1;
  static const int unknown_error = -1;

  /// Success 接口返回正常
  static const SUCCESS = 0;
  /// 后端处理请求异常
  static const FAIL = -1;

  static final Map<int, NetError> _errorMap = <int, NetError>{
    FAIL: NetError(FAIL, '服务器异常，请稍后再试~'),
  };

  static NetError? handleException(dynamic error) {
    print(error);
    if (error is DioError) {
      if (error.type.errorCode == -1) {
        return _handleException(error.error);
      } else {
        return _errorMap[error.type.errorCode];
      }
    } else {
      return _handleException(error);
    }
  }

  static NetError? _handleException(dynamic error) {
    int errorCode = unknown_error;
    if (error is IOException) {
      errorCode = socket_error;
    }
    if (error is HttpException) {
      errorCode = http_error;
    }
    if (error is FormatException) {
      errorCode = parse_error;
    }
    return _errorMap[errorCode];
  }
}

class NetError {
  int ret;
  String msg;

  NetError(this.ret, this.msg);
}

extension DioErrorTypeExtension on DioErrorType {
  int get errorCode => [
    ExceptionHandle.connect_timeout_error,
    ExceptionHandle.send_timeout_error,
    ExceptionHandle.receive_timeout_error,
    -1,
    ExceptionHandle.cancel_error,
    -1,
  ][index];
}
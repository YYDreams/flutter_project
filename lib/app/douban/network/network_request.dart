import 'dart:convert';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_project/widget/toast.dart';
import 'error_handle.dart';
import 'network_config.dart';

// 成功回调
typedef SuccessCallback<T> = Function(T data);
// 失败回调
typedef FailureCallback<T> = Function(int code, String msg);

///BaseEntity
const String data = 'data';
const String msg = 'msg';
const String code = 'code';
const String success = "success";

//请求方式
enum Method { get, post, put, patch, delete, head }

extension MethodExtension on Method {
  String get value => ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'HEAD'][index];
}

List<Interceptor> _interceptors = [];

// 网络请求
class NetworkBaseRequest {
  static final NetworkBaseRequest _singleton = NetworkBaseRequest._();

  static NetworkBaseRequest get instance => NetworkBaseRequest();

  factory NetworkBaseRequest() => _singleton;
  var dio = Dio();

  NetworkBaseRequest._() {
    final BaseOptions options = BaseOptions(
      connectTimeout: 3600,
      receiveTimeout: 3600,
      sendTimeout: 3600,
      responseType: ResponseType.json,
      validateStatus: (_) {
        return true;
      },
      baseUrl: NetworkConfig.getBaseUrl(),
      headers: header(),
    );
    dio.options = options;

    // 使用 Charles进行抓包
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.findProxy = (uri) {
        return "PROXY 127.0.0.1:8888";
      };
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };

    // 设置log打印
    if (dio.interceptors.isEmpty) {
      dio.interceptors.add(LogInterceptors());
    }

    // for (var interceptor in _interceptors) {
    //   dio.interceptors.add(interceptor);
    // }
  }

  // 请求头
  Map<String, dynamic>? header() {
    return null;
  }

  // 公共参数
  Map<String, dynamic>? globalQueryParams() {
    return null;
  }

  //
  Future request(
    Method method,
    String url, {
    required SuccessCallback<Map<String, dynamic>> onSuccess,
    required FailureCallback onError,
    Map<String, dynamic>? params,
  }) async {
    return _senderRequest(method.value, url,
            data: params, queryParameters: params)
        .then<void>((Map<String, dynamic> result) {
      if (result[code] == 0) {
        onSuccess(result[data]);
      } else {
        //请求失败
        _onError(result[code], msg, onError);
      }
    }, onError: (dynamic e) {
      //取消请求
      // _cancelLogPrint(e, url);
      final NetError? error = ExceptionHandle.handleException(e);
      _onError(error?.ret ?? -1, error?.msg ?? "", onError);
    });
  }

  Future<Map<String, dynamic>> _senderRequest(
    String method,
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    final Response<String> response = await dio.request(
      url,
      data: data,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
      options: _checkOptions(method, options),
    );

    try {
      final String data = response.data.toString();
      final Map<String, dynamic> _map = parseData(data);
      return _map;
    } catch (e) {
      // debugPrint(e.toString());
      return <String, dynamic>{
        "code": ExceptionHandle.FAIL,
        "msg": e.toString(),
        "data": null
      };
    }
  }

  ///response.data.toString >>>> Map<String,dynamic> 的数据转换
  Map<String, dynamic> parseData(String data) {
    return json.decode(data) as Map<String, dynamic>;
  }

  Options _checkOptions(String method, Options? options) {
    options ??= Options();
    options.method = method;
    return options;
  }

  //请求出错
  void _onError(int code, String msg, FailureCallback fail) {
    if (code != 0) {
      code = ExceptionHandle.FAIL;
      msg = '服务器度假去了，请稍后再试...';
    }

    //根据code统一处理错误  eg:登录已失效，请重新登录
    // if (code == 401) {
    //   showToast("登录已失效，请重新登录");
    //   clearUserCache();
    //   NavigatorUtils.push(
    //       Global.navigatorKey.currentContext, LoginRouter.smsLoginPage,
    //       clearStack: true, replace: true);
    //   return;
    // }
    fail(code, msg);
    showToast(msg);
  }
}

// 日志打印拦截器
class LogInterceptors extends InterceptorsWrapper {
  late DateTime _startTime;
  late DateTime _endTime;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _startTime = DateTime.now();
    print('----------Start----------开始请求时间:${_startTime}');
    print(
        "发起请求 =>method:[${options.method}] => PATH:${options.baseUrl}${options.path}");
    print("请求头 =>${options.headers}");
    print(
        "请求data =>${options.data} 请求queryParameters:${options.queryParameters}");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _endTime = DateTime.now();
    final int duration = _endTime.difference(_startTime).inMilliseconds;
    print(
        "收到响应 => PATH:${response.requestOptions.baseUrl}${response.requestOptions.path}");
    print("响应数据 => ${response.data}");
    print('----------End----------结束请求时间:${_endTime} 耗时:${duration}毫秒');

    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print(
        "错误数据[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}");
    super.onError(err, handler);
  }
}

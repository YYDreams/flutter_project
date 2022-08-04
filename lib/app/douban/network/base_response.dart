// 服务器响应实体封装：基类
class BaseResponse<T> {
  int code;
  String msg;
  dynamic data;
  BaseResponse.create(this.code, this.msg, this.data);

  BaseResponse.fromJson(Map<String, dynamic> json)
      : code = json['code'],
        msg = json['msg'],
        data = json['data'];
}

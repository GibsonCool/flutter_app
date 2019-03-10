///接口返回内容的基类
class BaseResponse<T>{
  T data;
  int errorCode;
  String errorMsg;

  BaseResponse(this.data, this.errorCode, this.errorMsg);
}

import 'package:dio/dio.dart';

import 'base_http.dart';
import 'response_model.dart';

TaeHttp taeHttp = TaeHttp();

class TaeHttp extends BaseHttp {
  @override
  void init() {
    options.baseUrl = 'http://back.66yunliantest.com';
    interceptors.add(ShipInterceptor());
  }
}

/// 船运帮业务接口操作
class ShipInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    // 添加固定header
    options.headers['content-type'] = 'application/json;charset=UTF-8';
    options.headers['appcode'] = '200c0b42d77e44b79d1cea1cfbfdbc63';
    // 添加token
    // String _token = UserManager().token;
    // if (_token != null && _token != '') {
    //   options.headers['token'] = _token;
    // }
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    ResponseModel responseModel = ResponseModel.fromJson(response.data);
    if (responseModel.code == -1001) {
      // throw UnAuthorizedException();
    } else {
      response.data = responseModel.data;
      return taeHttp.resolve(response);
    }
  }
}

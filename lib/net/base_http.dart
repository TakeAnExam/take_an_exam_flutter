import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

abstract class BaseHttp extends DioForNative {
  BaseHttp() {
    interceptors.add(HeaderInterceptor());
   (httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
       (client) {
     client.findProxy = (uri) {
       return 'PROXY 10.26.29.45:8888';
     };
   };
    init();
  }

  void init();
}

/// 添加通用header的拦截器
class HeaderInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    options.connectTimeout = 60 * 1000;
    options.receiveTimeout = 60 * 1000;
    options.headers['User-Agent'] =
        'Mozilla/5.0 (Linux; Android 9; CLT-AL01 Build/HUAWEICLT-AL01; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/66.0.3359.126 MQQBrowser/6.2 TBS/044904 Mobile Safari/537.36 wxwork/2.8.16 MicroMessenger/7.0.1 NetType/WIFI Language/zh';
    return super.onRequest(options);
  }
}

import 'package:dio/dio.dart';
import 'package:untitled1/datas/app_data.dart';
import 'package:untitled1/datas/app_url.dart';
import 'package:untitled1/utils/preference_utility.dart';

class HttpClientService {
  static final HttpClientService _singleton = HttpClientService._();
  static HttpClientService get instance => _singleton;
  HttpClientService._();

  Dio get dio {
    Dio dio = Dio();
    dio.interceptors.add(MiddlewareInterceptor());
    return dio;
  }

  BaseOptions setupOptionDio() {
    return BaseOptions(
      baseUrl: AppData.hostApiURL,
      headers: {
        "Content-Type": "application/json",
        "Accept":"*/*",
        "Access-Control-Allow-Origin": "*",
        "Connection":"keep-alive"
      }
    );
  }
}
class MiddlewareInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    // if (options.path.contains('/forecast')) {
    //   options.baseUrl = AppUrl.proWeatherBase;
    // } else {
    // }
      options.baseUrl = AppUrl.weatherBase;
    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    return handler.next(err);
  }
}
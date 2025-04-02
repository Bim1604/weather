import 'package:dio/dio.dart';
import 'package:untitled1/datas/app_data.dart';
import 'package:untitled1/utils/preference_utility.dart';

class HttpClientService {
  static final HttpClientService _singleton = HttpClientService._();
  static HttpClientService get instance => _singleton;
  HttpClientService._();

  Dio get dio {
    // If completer is null, AppDatabaseClass is newly instantiated, so database is not yet opened
    Dio dio = Dio(setupOptionDio());
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
    var token = PreferenceUtility.getString(AppData.tokenKey);
    var fcmToken = PreferenceUtility.getString(AppData.fcmKey);
      options.headers["fcm_token"] = fcmToken;
      options.contentType = "application/json";
    if(token.isNotEmpty){
      options.headers["Authorization"] = "Bearer $token";
    }
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
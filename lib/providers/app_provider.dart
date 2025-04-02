import 'package:dio/dio.dart';
import 'package:untitled1/services/http_client_service.dart';

class AppProvider{
  Dio httpClient = HttpClientService.instance.dio;
  AppProvider();
}

import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:untitled1/datas/app_key.dart';
import 'package:untitled1/datas/app_url.dart';
import 'package:untitled1/models/current_weather_model.dart';
import 'package:untitled1/services/http_client_service.dart';

class AppProvider{
  Dio httpClient = HttpClientService.instance.dio;
  AppProvider();
}

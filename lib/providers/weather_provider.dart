import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:untitled1/datas/app_key.dart';
import 'package:untitled1/datas/app_url.dart';
import 'package:untitled1/models/current_weather_model.dart';
import 'package:untitled1/models/geo_model.dart';
import 'package:untitled1/models/weather_forecast_model.dart';
import 'package:untitled1/providers/app_provider.dart';
import 'package:untitled1/services/http_client_service.dart';

class WeatherProvider extends AppProvider {
  WeatherProvider() {
    httpClient = HttpClientService.instance.dio;
  }

  Future<CurrentWeatherModel?> getCurrentWeather ({required Position pos}) async {
    CurrentWeatherModel? data;
    Response response = await httpClient.get(AppUrl.weatherPath, queryParameters: {
      'lat': pos.latitude,
      'lon': pos.longitude,
      'appid': AppKey.apiKey,
      'units': 'metric',
      'lang': 'vi',
    });
    if (response.statusCode != 200) return null;
    data = CurrentWeatherModel.fromJson(response.data);
    return data;
  }

  Future<GeoModel?> getCurrentGeo ({required Position pos}) async {
    GeoModel? data;
    Response response = await httpClient.get(AppUrl.geoPath, queryParameters: {
      'lat': pos.latitude,
      'lon': pos.longitude,
      'appid': AppKey.apiKey,
      'limit': 1,
    });
    if (response.statusCode != 200 || (response.data as List).isEmpty) return null;
    data = GeoModel.fromJson((response.data as List).first);
    return data;
  }

  Future<WeatherForecast?> getWeather4day ({required Position pos}) async {
    WeatherForecast? data;
    String representativeHour = "15:00:00"; /// Take a time frame that represents the temperature of the entire day
    Response response = await httpClient.get(AppUrl.fiveDays3HourPath, queryParameters: {
      'lat': pos.latitude,
      'lon': pos.longitude,
      'exclude': 'current,minutely,hourly,alerts',
      'appid': AppKey.apiKey,
      'units': 'metric',
    });
    if (response.statusCode != 200) return null;
    data = WeatherForecast.fromJson5days(response.data, representativeHour);
    return data;
  }
}
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:untitled1/models/current_weather_model.dart';
import 'package:untitled1/models/geo_model.dart';
import 'package:untitled1/models/weather_forecast_model.dart';
import 'package:untitled1/providers/weather_provider.dart';
import 'package:untitled1/services/location_service.dart';
import 'package:untitled1/utils/log_utils.dart';

class HomeController extends GetxController {

  RxBool isLoading = true.obs;
  Rx<CurrentWeatherModel> data = CurrentWeatherModel().obs;
  Rx<GeoModel> geoData = GeoModel().obs;
  Rx<WeatherForecast> forecastData = Rx<WeatherForecast>(WeatherForecast.defaultInstance());
  Position? currentLocation;
  RxBool isErr = false.obs;
  late WeatherProvider weatherProvider;

  @override
  void onInit() {
    weatherProvider = WeatherProvider();
    super.onInit();
  }

  @override
  void onReady() {
    onFetchData();
    super.onReady();
  }

  void onFetchData () async {
    try {
      isLoading.value = true;
      await initCurrentLocation();
      await Future.wait([
        getCurrentWeather(),
        getCurrentGeo(),
        getWeather4daysNext(),
      ]);
      isLoading.value = false;
      isErr.value = false;
    } catch (e) {
      LogUtils.writeLog(content: e.toString(), func: "HomeController");
      isLoading.value = false;
      isErr.value = true;
    }
  }

  bool isHasCurrentLocation() {
    if (currentLocation == null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text("Không tìm thấy vị trí hiện tại"),
          backgroundColor: Colors.blue,
          duration: Duration(seconds: 3),
        ),
      );
      return false;
    }
    return true;
  }

  Future<void> initCurrentLocation() async {
    currentLocation = await LocationService.getCurrentLocation();
    if (currentLocation == null) return;
  }
  
  Future<void> getCurrentWeather() async {
    bool validCurrentLocation = isHasCurrentLocation();
    if (validCurrentLocation == false) return;
    CurrentWeatherModel? result = await weatherProvider.getCurrentWeather(pos: currentLocation!);
    if (result == null) {
      isErr.value = true;
      return;
    }
    data.value = result;
  }

  Future<void> getCurrentGeo() async {
    bool validCurrentLocation = isHasCurrentLocation();
    if (validCurrentLocation == false) return;
    GeoModel? result = await weatherProvider.getCurrentGeo(pos: currentLocation!);
    if (result == null) {
      isErr.value = true;
      return;
    }
    geoData.value = result;
  }

  Future<void> getWeather4daysNext() async {
    bool validCurrentLocation = isHasCurrentLocation();
    if (validCurrentLocation == false) return;
    WeatherForecast? result = await weatherProvider.getWeather4day(pos: currentLocation!);
    if (result == null) {
      isErr.value = true;
      return;
    }
    forecastData.value = result;
  }

}
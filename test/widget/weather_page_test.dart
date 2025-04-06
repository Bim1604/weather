import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:get/get.dart';
import 'package:untitled1/models/current_weather_model.dart';
import 'package:untitled1/models/geo_model.dart';
import 'package:untitled1/models/weather_forecast_model.dart';
import 'package:untitled1/providers/weather_provider.dart';
import 'package:untitled1/screens/app/views/app_view.dart';
import 'package:untitled1/screens/elements/error_view_element.dart';
import 'package:untitled1/screens/elements/loading_view_element.dart';
import 'package:untitled1/screens/home/controllers/home_controller.dart';
import 'package:untitled1/screens/home/home_elements/home_header_element.dart';
import 'package:untitled1/screens/home/views/home_view.dart';
import 'package:untitled1/utils/time_utils.dart';

class TestHomeController extends GetxController implements HomeController {
  @override
  RxBool isLoading = false.obs;

  @override
  RxBool isErr = false.obs;

  @override
  Rx<CurrentWeatherModel> data = CurrentWeatherModel().obs;

  @override
  Rx<GeoModel> geoData = GeoModel().obs;

  @override
  Rx<WeatherForecast> forecastData = Rx<WeatherForecast>(WeatherForecast.defaultInstance());

  bool retried = false;

  @override
  void onFetchData() {
    retried = true;
  }

  @override
  Position? currentLocation;

  @override
  WeatherProvider weatherProvider = WeatherProvider();

  @override
  Future<void> getCurrentGeo() {
    // TODO: implement getCurrentGeo
    throw UnimplementedError();
  }

  @override
  Future<void> getCurrentWeather() {
    // TODO: implement getCurrentWeather
    throw UnimplementedError();
  }

  @override
  Future<void> getWeather4daysNext() {
    // TODO: implement getWeather4daysNext
    throw UnimplementedError();
  }

  @override
  Future<void> initCurrentLocation() {
    // TODO: implement initCurrentLocation
    throw UnimplementedError();
  }

  @override
  bool isHasCurrentLocation() {
    // TODO: implement isHasCurrentLocation
    throw UnimplementedError();
  }
}

void main() {
  final controller = TestHomeController();
  setUp(() {
    Get.testMode = true;
  });

  testWidgets('Shows loading screen when loading', (WidgetTester tester) async {

    controller.isLoading.value = true;
    Get.put<HomeController>(controller);

    await tester.pumpWidget(const GetMaterialApp(home: HomeView()));

    expect(find.byType(LoadingViewElement), findsOneWidget);
  });

  testWidgets('Shows current location when loaded', (WidgetTester tester) async {
    controller.isLoading.value = false;
    controller.isErr.value = false;

    controller.geoData.value = GeoModel(name: 'Ho Chi Minh City');
    Get.put<HomeController>(controller);

    await tester.pumpWidget( const GetMaterialApp(home: HomeView()));

    expect(find.text('Ho Chi Minh City'), findsOneWidget);

  });
  testWidgets('Shows current temperature when loaded', (WidgetTester tester) async {
    controller.isLoading.value = false;
    controller.isErr.value = false;

    controller.data.value = CurrentWeatherModel(main: Main(temp: 28));
    Get.put<HomeController>(controller);

    await tester.pumpWidget( const GetMaterialApp(home: HomeView()));

    expect(find.text('28°'), findsOneWidget);

  });

  testWidgets('Shows average temperature for next 4 days when loaded', (WidgetTester tester) async {
    controller.isLoading.value = false;
    controller.isErr.value = false;

    Map<String, List<double>> dailyTemps = {
      "2025-04-06": [29.6, 29.8, 30.2, 30.4, 30], /// 30
      "2025-04-07": [30.6, 29.8, 30.8, 30.9, 31], /// 30.62 -> round -> 31
      "2025-04-08": [29.4, 29.6, 29.9, 30.3, 30], /// 29.85 -> round -> 30
      "2025-04-09": [29.2, 29.3, 30.2, 30.5, 30.4], /// 29.92 -> round -> 30
    };

    controller.forecastData.value.dailyTemp = dailyTemps;
    controller.forecastData.value.list = [
      ForecastItem(dailyKey: "2025-04-06", day: DateTime.parse("2025-04-06")),
      ForecastItem(dailyKey: "2025-04-07", day: DateTime.parse("2025-04-07")),
      ForecastItem(dailyKey: "2025-04-08", day: DateTime.parse("2025-04-08")),
      ForecastItem(dailyKey: "2025-04-09", day: DateTime.parse("2025-04-09")),
    ];

    Get.put<HomeController>(controller);

    await tester.pumpWidget( const GetMaterialApp(home: HomeView()));
    await tester.pumpAndSettle();

    expect(find.text("30C"), findsNWidgets(3));
    expect(find.text("31C"), findsOneWidget);

  });

  testWidgets('Shows dates for the next 4 days', (WidgetTester tester) async {
    controller.isLoading.value = false;
    controller.isErr.value = false;

    Map<String, List<double>> dailyTemps = {
      "2025-04-06": [29.6, 29.8, 30.2, 30.4, 30], /// 30
      "2025-04-07": [30.6, 29.8, 30.8, 30.9, 31], /// 30.62 -> round -> 31
      "2025-04-08": [29.4, 29.6, 29.9, 30.3, 30], /// 29.85 -> round -> 30
      "2025-04-09": [29.2, 29.3, 30.2, 30.5, 30.4], /// 29.92 -> round -> 30
    };

    controller.forecastData.value.dailyTemp = dailyTemps;
    controller.forecastData.value.list = [
      ForecastItem(dailyKey: "2025-04-06", day: DateTime.parse("2025-04-06")),
      ForecastItem(dailyKey: "2025-04-07", day: DateTime.parse("2025-04-07")),
      ForecastItem(dailyKey: "2025-04-08", day: DateTime.parse("2025-04-08")),
      ForecastItem(dailyKey: "2025-04-09", day: DateTime.parse("2025-04-09")),
    ];

    Get.put<HomeController>(controller);

    await tester.pumpWidget( const GetMaterialApp(home: HomeView()));
    await tester.pumpAndSettle();

    for (var item in controller.forecastData.value.list) {
      expect(find.text(TimeUtils.getWeekday(item.day!)), findsOneWidget);
    }


  });

  testWidgets('Shows error screen when error occurs', (WidgetTester tester) async {
    controller.isLoading.value = false;
    controller.isErr.value = true;
    Get.put<HomeController>(controller);

    await tester.pumpWidget(const GetMaterialApp(home: HomeView()));

    expect(find.byType(ErrorViews), findsOneWidget);
    expect(find.text('Something went wrong at our end!'), findsOneWidget);
    expect(find.text('RETRY'), findsOneWidget);
  });

  testWidgets('Retry button triggers onFetchData', (WidgetTester tester) async {
    controller.isLoading.value = false;
    controller.isErr.value = true;
    Get.put<HomeController>(controller);

    await tester.pumpWidget(const GetMaterialApp(home: HomeView()));

    expect(find.byType(ErrorViews), findsOneWidget);

    await tester.tap(find.text('RETRY'));
    await tester.pump();

    expect(controller.retried, isTrue);
  });
}

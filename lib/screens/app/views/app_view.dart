import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/datas/app_config.dart';
import 'package:untitled1/routers/app_router.dart';
import 'package:untitled1/routers/page_router.dart';
import 'package:untitled1/screens/app/bindings/app_binding.dart';
import 'package:untitled1/screens/app/controllers/app_controller.dart';
import 'package:untitled1/utils/locale_utils.dart';

class AppScreen extends GetWidget<AppController>{

  const AppScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Weather App",
      color: Colors.transparent,
      locale: LocalizationUtils.locale,
      fallbackLocale: LocalizationUtils.fallbackLocale,
      translations: LocalizationUtils(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      initialBinding: AppBinding(),
      initialRoute: AppRouter.home,
      getPages: AppPages.list,
      themeMode: ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
        textTheme: AppConfig.textTheme
      ),
    );
  }
}
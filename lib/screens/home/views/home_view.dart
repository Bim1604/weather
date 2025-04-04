import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/screens/elements/error_view_element.dart';
import 'package:untitled1/screens/elements/loading_view_element.dart';
import 'package:untitled1/screens/home/controllers/home_controller.dart';
import 'package:untitled1/screens/home/home_elements/home_body_element.dart';
import 'package:untitled1/screens/home/home_elements/home_header_element.dart';

class HomeView extends GetWidget<HomeController> {
  const HomeView({super.key});

  Widget getWidgetByStatus() {
    if (controller.isLoading.value) {
      return const LoadingViewElement();
    }
    return Column(
      children: [
        HomeHeaderElement(
          location: (controller.geoData.value.name ?? ""),
          temperature: (controller.data.value.main?.temp ?? 0.0).round().toString(),
        ),
        Expanded(child: HomeBodyElement())
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() => getWidgetByStatus()),
      ),
    );
  }

}
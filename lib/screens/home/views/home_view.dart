import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/screens/elements/error_view_element.dart';
import 'package:untitled1/screens/home/controllers/home_controller.dart';

class HomeView extends GetWidget<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: ErrorViews(),
    );
  }

}
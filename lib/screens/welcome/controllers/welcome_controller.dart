import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled1/routers/app_router.dart';
import 'package:untitled1/services/location_service.dart';

class WelcomeController extends GetxController {
  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init () async {
    bool permission = await LocationService.checkPermissionLocation();
    if (!permission) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text("Please enable location permission and restart the app"),
          backgroundColor: Colors.redAccent,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }
    Get.toNamed(AppRouter.home);
  }
}
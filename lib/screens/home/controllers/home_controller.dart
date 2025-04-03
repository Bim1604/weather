import 'dart:developer';

import 'package:get/get.dart';
import 'package:untitled1/utils/log_utils.dart';

class HomeController extends GetxController {

  RxBool isLoading = true.obs;

  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init () async {
    try {
      await Future.wait([
        initCurrentLocation()
      ]);
      isLoading.value = false;
    } catch (e) {
      LogUtils.writeLog(content: e.toString(), func: "HomeController");
    }
  }

  Future<void> initCurrentLocation() async {
    await Future.delayed(const Duration(seconds: 7));
  }

}
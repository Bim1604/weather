import 'package:get/get.dart';
import 'package:untitled1/screens/app/controllers/app_controller.dart';

class AppBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AppController>(() => AppController());
  }

}
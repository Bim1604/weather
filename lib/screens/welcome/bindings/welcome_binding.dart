import 'package:get/get.dart';
import 'package:untitled1/screens/app/controllers/app_controller.dart';
import 'package:untitled1/screens/welcome/controllers/welcome_controller.dart';

class WelcomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }

}
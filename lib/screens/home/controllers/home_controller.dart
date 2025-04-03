import 'package:get/get.dart';

class HomeController extends GetxController {

  RxBool isLoading = false.obs;


  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init () async {
    await Future.wait([
      initCurrentLocation()
    ]);
  }

  Future<void> initCurrentLocation() async {

  }

}
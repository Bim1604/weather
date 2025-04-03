import 'package:get/get.dart';
import 'package:untitled1/routers/app_router.dart';
import 'package:untitled1/screens/home/bindings/home_binding.dart';
import 'package:untitled1/screens/home/views/home_view.dart';

class AppPages{
  static List<GetPage<dynamic>>? list =[
    GetPage(
      name: AppRouter.home,
      page: () => const HomeView(),
      binding: HomeBinding()
    ),
  ];
}
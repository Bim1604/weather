import 'package:get/get.dart';
import 'package:untitled1/routers/app_router.dart';
import 'package:untitled1/screens/home/bindings/home_binding.dart';
import 'package:untitled1/screens/home/views/home_view.dart';
import 'package:untitled1/screens/welcome/bindings/welcome_binding.dart';
import 'package:untitled1/screens/welcome/views/welcome_view.dart';

class AppPages{
  static List<GetPage<dynamic>>? list =[
    GetPage(
      name: AppRouter.home,
      page: () => const HomeView(),
      binding: HomeBinding()
    ),
    GetPage(
      name: AppRouter.welcome,
      page: () => const WelcomeView(),
      binding: WelcomeBinding()
    ),
  ];
}
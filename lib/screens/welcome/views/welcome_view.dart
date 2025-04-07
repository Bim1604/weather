import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:untitled1/screens/elements/loading_view_element.dart';
import 'package:untitled1/screens/welcome/controllers/welcome_controller.dart';

class WelcomeView extends GetWidget<WelcomeController>{
  const WelcomeView({super.key});


  @override
  Widget build(BuildContext context) {
      return const LoadingViewElement();
  }

}
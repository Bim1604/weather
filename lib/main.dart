import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/screens/app/views/app_view.dart';
import 'package:untitled1/utils/preference_utility.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  PreferenceUtility.localStorage = await SharedPreferences.getInstance();
  runApp(const AppScreen());
}
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/screens/app/app_view.dart';
import 'package:untitled1/utils/preference_utility.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  PreferenceUtility.localStorage = await SharedPreferences.getInstance();
  runApp(const AppScreen());
}
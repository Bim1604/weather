import 'package:untitled1/datas/app_url.dart';

class AppData {

  static String get hostApiURL{
    String result = "";
    try{
      result = AppUrl.weatherBase;
    }
    catch(ex){
      
    }
    return result;
  }

  static const String tokenKey = "TOKEN_KEY";
  static const String fcmKey = "FCM_TOKEN_KEY";
}
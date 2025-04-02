import 'package:untitled1/utils/preference_utility.dart';

class AppData {

  static String get hostURL{
    String result = "";
    try{
      var hostURL = PreferenceUtility.getString(appHostKey);
      result = hostURL;
    }
    catch(ex){
      
    }
    return result;
  }

  static String get hostApiURL{
    String result = "";
    try{
      result = "$hostURL/api";
    }
    catch(ex){
      
    }
    return result;
  }

  static String get hostStorageURL{
    String result = "";
    try{
      result = "$hostURL/storage/";
    }
    catch(ex){
      
    }
    return result;
  }

  static const String tokenKey = "TOKEN_KEY";
  static const String fcmKey = "FCM_TOKEN_KEY";
  static const String appHostKey = "APP_HOST_KEY";
  static const String appVersionKey = "APP_VERSION_KEY";
  static const String appIntroKey = "APP_INTRO_KEY";
  static const String userKey = "USER_INFO";
}
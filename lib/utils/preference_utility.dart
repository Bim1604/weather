import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtility{
 static late SharedPreferences localStorage;
 static Future initStates() async{
  localStorage = await SharedPreferences.getInstance();
 }
 static String getString(String key){
    String result ="";
    try{
      result = localStorage.getString(key)??"";
    }
    catch(ex){
      ////AppLogsUtils.instance.writeLogs(ex,func: "getString preferences.Utility");
    }
    return result;
  } // end

  static Future<bool> saveString(String key,String value) async {
    bool result = false;
    try{
      await localStorage.setString(key, value);
      result= true;
    }
    catch(ex){
      ////AppLogsUtils.instance.writeLogs(ex,func: "saveString preferences.Utility");
    }
    return result;
  }

  static Future<bool> saveBool(String key,bool value) async {
    bool result = false;
    try{
      await localStorage.setBool(key, value);
      result= true;
    }
    catch(ex){
      //AppLogsUtils.instance.writeLogs(ex,func: "saveBool preferences.Utility");
    }
    return result;
  }

  static bool getBool(String key) {
   bool result =false;
    try{
      result = localStorage.getBool(key)??false;
    }
    catch(ex){
      //AppLogsUtils.instance.writeLogs(ex,func: "getBool preferences.Utility");
    }
    return result;
  }

  static List<String> getListString(String key) {
    List<String> result =List<String>.empty(growable: true);
    try{
      result = localStorage.getStringList(key)??List<String>.empty(growable: true);
    }
    catch(ex){
      //AppLogsUtils.instance.writeLogs(ex,func: "getListString preferences.Utility");
    }
    return result;
  }
  static Future<bool> saveListString(String key,List<String> value) async {
    bool result = false;
    try{
      await localStorage.setStringList(key, value);
      result= true;
    }
    catch(ex){
      //AppLogsUtils.instance.writeLogs(ex,func: "saveBool preferences.Utility");
    }
    return result;
  }

  static Future<bool> removeByKey(String key) async {
    bool result = false;
    try{
      await localStorage.remove(key);
      result= true;
    }
    catch(ex){
      //AppLogsUtils.instance.writeLogs(ex,func: "removeByKey preferences.Utility");
    }
    return result;
  }

  static double getNumber(String key) {
    double result =0.0;
    try{
      result = localStorage.getDouble(key)??0.0;
    }
    catch(ex){
      //AppLogsUtils.instance.writeLogs(ex,func: "getNumber preferences.Utility");
    }
    return result;
  } // end

  static Future<bool> saveNumber(String key,double value) async {
    bool result = false;
    try{
      await localStorage.setDouble(key, value);
      result= true;
    }
    catch(ex){
      //AppLogsUtils.instance.writeLogs(ex,func: "saveNumber preferences.Utility");
    }
    return result;
  }
} 

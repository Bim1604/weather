import 'dart:developer';

class LogUtils {
  static void writeLog({required String content, required String func}) {
    log("ERR at $func}: $content", time: DateTime.now());
  }
}
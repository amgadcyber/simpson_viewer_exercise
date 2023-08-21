/* 
  From its name, it's main Purpose to view logs in the console,
  It is using Getx loggin feature


  Author: Amgad Fahd
  Github: https://github.com/amgadcyber

*/

import 'dart:developer' as dev;

import 'package:get/get.dart';

import '../configs/flavors.dart';

class Logger {
  /// [logWriterCallback] -- Output logs to console
  static void logWriterCallback(String message, {bool isError = false}) {
    if (isError || Get.isLogEnable) dev.log(message, name: AppFlavor.title);
  }

  /// [debugPrint] -- Print an Object to console
  static void debugPrint(Object message) {
    if (Get.isLogEnable) {
      dev.log(
        message.toString(),
        name: AppFlavor.title,
        time: DateTime.now(),
      );
    }
  }

  /// [debugPrintError] -- Print Error to console
  static void debugPrintError(Object message) {
    if (Get.isLogEnable) {
      dev.log(
        message.toString(),
        name: AppFlavor.title,
        error: true,
        time: DateTime.now(),
      );
    }
  }
}

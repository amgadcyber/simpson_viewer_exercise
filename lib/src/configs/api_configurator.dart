/*
  Default App API Configurator
*/

import 'enums.dart';

class APIConfigurator {

  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get api {
    switch (appFlavor) {
      case Flavor.variantOne:
        return 'Simpsons Charactessr Viewer';
      case Flavor.variantTwo:
        return ' The Wire Character Viewer';
      default:
        return 'title';
    }
  }
  
}



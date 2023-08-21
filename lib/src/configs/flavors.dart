import 'configs.dart';

class AppFlavor {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  /// [title] - return the title of the current variant
  static String get title {
    switch (appFlavor) {
      case Flavor.variantOne:
        return appVersionOneName;
      case Flavor.variantTwo:
        return appVersionTwoName;
      default:
        return 'title';
    }
  }

  /// [dataAPI] -- Return the endpoint URL for each variant
  static String get dataAPI {
    switch (appFlavor) {
      case Flavor.variantOne:
        return '$baseURL/?q=simpsons+characters&format=json';
      case Flavor.variantTwo:
        return '$baseURL/?q=the+wire+characters&format=json';
      default:
        return '';
    }
  }
}

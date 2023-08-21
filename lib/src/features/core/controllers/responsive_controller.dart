/* 
  TODO: Responsive View

  [X] 1. Support both portrait and landscape orientations
  [X] 2. Responsive Layout For Tablet Screen
*/

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ResponsiveController extends GetxController {
  static ResponsiveController get instance => Get.find();

  Rx<Orientation> orientation = Orientation.portrait.obs;

  final Rx<ScreenType> screenType = Rx(ScreenType.Phone);

  /// [updateOrientation] -- Update Orientation value
  void updateOrientation(Orientation newOrientation) {
    orientation.value = newOrientation;
  }
}

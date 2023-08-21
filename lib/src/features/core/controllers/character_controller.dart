import 'package:get/get.dart';

import '../../core.dart';

class CharacterController extends GetxController {
  static CharacterController get instance => Get.find();
  final Rx<CharacterData?> character = Rx(null);

  /// [assignCharacter] -- Assign Character Value
  void assignCharacter() {
    character.value = Get.arguments as CharacterData;
  }
}

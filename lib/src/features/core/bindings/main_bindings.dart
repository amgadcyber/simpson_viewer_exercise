import 'package:get/get.dart';

import '../../../repository/api_repository.dart';
import '../../core.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(
      APIRepository(),
      permanent: true,
    );
    Get.put(
      MainController(),
      permanent: true,
    );
    Get.put(
      ResponsiveController(),
      permanent: true,
    );
    Get.lazyPut(
      () => CharacterController(),
      fenix: true,
    );
  }
}

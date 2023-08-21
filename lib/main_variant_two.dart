import 'src/configs/enums.dart';
import 'src/configs/flavors.dart';

import 'main.dart' as runner;

Future<void> main() async {
  AppFlavor.appFlavor = Flavor.variantTwo;
  await runner.main();
}

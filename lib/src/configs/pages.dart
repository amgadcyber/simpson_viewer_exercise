import 'package:get/get.dart';

import '../features/core.dart';
import 'routes.dart';

List<GetPage> pages = [
  GetPage(
    name: Routes.mainView,
    page: () => const MainView(),
  ),
  GetPage(
    name: Routes.detailsView,
    page: () => const DetailsView(),
    binding: BindingsBuilder.put(
      () => CharacterController(),
    ),
  ),
];

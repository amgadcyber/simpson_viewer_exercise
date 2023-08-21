import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core.dart';

class MainView extends GetView<MainController> {
  const MainView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CharactersListView();
  }
}

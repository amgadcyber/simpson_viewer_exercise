import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/configs/configs.dart';
import 'src/features/core.dart';
import 'src/utils/logger.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      logWriterCallback: Logger.logWriterCallback,
      title: AppFlavor.title,
      theme: ThemeData(
        primarySwatch: primarySwatch,
        useMaterial3: true,
      ),
      initialBinding: MainBindings(),
      // initialRoute: Routes.mainView,
      getPages: pages,
      home: _flavorBanner(
        child: ResponsiveView(),
        show: kDebugMode,
      ),
    );
  }

  /// [_flavorBanner] -- Show Current Variant type in a banner
  Widget _flavorBanner({
    required Widget child,
    bool show = true,
  }) =>
      show
          ? Banner(
              location: BannerLocation.topStart,
              message: AppFlavor.name,
              color: bannerBgColor,
              textStyle: textTheme.labelLarge!.copyWith(
                color: white,
              ),
              textDirection: TextDirection.ltr,
              child: child,
            )
          : Container(
              child: child,
            );
}

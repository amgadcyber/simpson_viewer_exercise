import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/app_bar.dart';
import '../../../core.dart';
import 'phone/phone_view.dart';
import 'tablet/tablet_view.dart';

class ResponsiveView extends GetResponsiveView<ResponsiveController> {
  ResponsiveView({super.key})
      : super(
          settings: const ResponsiveScreenSettings(
            tabletChangePoint: 600,
          ),
        );

  /// [buildView] -- Build View
  Widget buildView(Widget body) {
    return OrientationBuilder(
      builder: (context, orientation) {
        ResponsiveController.instance.updateOrientation(orientation);
        return Scaffold(
          appBar: const DAppBar(),
          body: MainController.instance.obx(
            (state) => body,
            onEmpty: _buildOnEmptyWidget(),
          ),
        );
      },
    );
  }

  /// [_buildOnEmptyWidget] -- A widget to show when data is empty
  Widget _buildOnEmptyWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('No Data Found'),
          OutlinedButton(
            onPressed: () {
              MainController.instance.grepCharacters();
            },
            child: const Text('Try'),
          ),
        ],
      ),
    );
  }

  @override
  Widget? phone() {
    controller.screenType.value = ScreenType.Phone;
    return buildView(const PhoneView());
  }

  @override
  Widget? tablet() {
    controller.screenType.value = ScreenType.Tablet;
    return buildView(const TabletView());
  }

  @override
  Widget builder() {
    controller.screenType.value = ScreenType.Phone;
    return buildView(const MainView());
  }
}

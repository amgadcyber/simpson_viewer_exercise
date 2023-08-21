/*
  TODO: 5. Character Details VIew
  Load the detail view of that character.
  Passed from the CharacterData 

  Author: Amgad Fahd
  Github: https://github.com/amgadcyber
*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/rounded_button_widget.dart';
import '../../../../configs/configs.dart';
import '../../../core.dart';

class DetailsView extends GetView<CharacterController> {
  const DetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet =
        ResponsiveController.instance.screenType.value == ScreenType.Tablet;
    return Scaffold(
      body: Obx(
        () => CustomScrollView(
          slivers: [
            SliverAppBar(
              collapsedHeight: collapsedHeight,
              expandedHeight: expandedHeight,

              leading: isTablet ? null : const RoundedButtonWidget(),
              floating: true,
              // snap: false,
              // pinned: false,
              flexibleSpace: Image.network(
                controller.character.value?.imageUrl! ?? placeHolderImage,
                fit: BoxFit.contain,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(smPadding),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(smPadding),
                      decoration: BoxDecoration(
                        color: white100,
                        borderRadius: BorderRadius.circular(defaultRadius),
                      ),
                      child: Text(
                        controller.character.value?.title ?? 'Title',
                        style: textTheme.labelLarge!.copyWith(
                          color: primarySwatch,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.all(smPadding + 3),
                      decoration: BoxDecoration(
                        color: white100,
                        borderRadius: BorderRadius.circular(defaultRadius),
                      ),
                      child: Text(
                        controller.character.value?.description ??
                            'Description',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

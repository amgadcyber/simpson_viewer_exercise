import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../configs/configs.dart';
import '../features/core.dart';
import 'rounded_button_widget.dart';

class DAppBar extends GetView<MainController> implements PreferredSizeWidget {
  const DAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppBar(
        title: _buildAppBarTitle(context),
        centerTitle: false,
        actions: [
          RoundedButtonWidget(
            onTap: () => controller.onSearchButtonPressed(context),
            iconPadding: const EdgeInsets.all(smPadding),
            size: defaultIconSize,
            icon: controller.isVisible.isTrue
                ? CupertinoIcons.clear
                : CupertinoIcons.search,
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarTitle(BuildContext context) {
    if (controller.isVisible.isFalse) {
      return Text(
        AppFlavor.title,
        style: textTheme.labelLarge!.copyWith(
          fontSize: dFontSize,
          fontWeight: FontWeight.bold,
        ),
      );
    } else {
      return _buildSearchField(context);
    }
  }

  Widget _buildSearchField(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: TextField(
        controller: controller.searchController,
        focusNode: controller.searchNode,
        autofocus: false,
        onChanged: (value) {
          controller.search(value);
        },
        decoration: InputDecoration(
          hintText: controller.searchByTitle.isTrue
              ? searchByTitleText
              : searchByDescText,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          labelStyle: textTheme.labelLarge,
          hintStyle: textTheme.labelSmall!.copyWith(
            fontSize: dFontSize,
          ),
          // hintStyle: textTheme.labelLarge,
          filled: false,
          fillColor: primaryColor100,
          suffix: RoundedButtonWidget(
            onTap: () =>
                controller.switchSearchMode(!controller.searchByTitle.value),
            iconPadding: const EdgeInsets.all(smPadding),
            size: 20,
            icon: controller.searchByTitle.isTrue
                ? Icons.description_outlined
                : Icons.title_outlined,
          ),
          helperStyle: textTheme.labelLarge,
        ),
        style: textTheme.labelLarge,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

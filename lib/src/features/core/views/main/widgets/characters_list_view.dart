/* 
   TODO: Add ListView witch display a list of character names with vertically scrollable

*/

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../configs/configs.dart';
import '../../../../core.dart';

class CharactersListView extends GetView<MainController> {
  const CharactersListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: controller.filteredCharacters.length,
              itemBuilder: (context, index) {
                final character = controller.filteredCharacters[index];
                return InkWell(
                  onTap: () {
                    if (ResponsiveController.instance.screenType.value ==
                        ScreenType.Phone) {
                      Get.toNamed(
                        Routes.detailsView,
                        arguments: character,
                        preventDuplicates: true,
                      );
                      CharacterController.instance.assignCharacter();
                    } else {
                      CharacterController.instance.character.value = character;
                    }
                  },
                  borderRadius: BorderRadius.circular(defaultRadius),
                  child: Container(
                    padding: const EdgeInsets.all(smPadding + 1),
                    margin: const EdgeInsets.all(smPadding * 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(defaultRadius),
                      color: primaryColor100,
                    ),
                    child: Text(
                      controller.searchByTitle.value
                          ? character.title
                          : character.description,
                      style: textTheme.labelLarge!.copyWith(
                        color: black87,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

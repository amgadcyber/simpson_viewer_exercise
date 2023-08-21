/* Perform An offline searching 
  
  It deals with data the same way real searching works


  Author: Amgad Fahd
  Github: https://github.com/amgadcyber
*/

// Mocked offline list of CharacterData for testing
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:simpsonviewer/src/features/core.dart';
import 'package:simpsonviewer/src/repository/api_repository.dart';

final List<CharacterData> mockedCharacterList = [
  CharacterData(
      title: 'Apu Nahasapeemapetilan',
      description: 'Description 1',
      firstUrl: ''),
  CharacterData(
    title: 'Homer Simpson',
    description: 'Description 2',
    firstUrl: '',
  ),
];

/// [registerControllers] -- Register Controllers
void registerControllers() {
  Get.put(
    APIRepository(),
    permanent: true,
  );
  Get.put(
    MainController(),
    permanent: true,
  );
}

/// [performSearchTests] -- Perform Search Tests
void performSearchTests() {
  group('Search Functionality Tests', () {
    late MainController controller;

    setUp(() {
      registerControllers();
      controller = MainController();
      controller.characters.assignAll(mockedCharacterList);
      controller.filteredCharacters.assignAll(mockedCharacterList);
      // Enable test mode to isolate GetX dependency injection
      Get.testMode = true;
    });

    test('Initial filtered Characters should contain all Characters', () {
      expect(controller.filteredCharacters, controller.characters);
    });

    test('Searching with non-empty query should filter Characters', () {
      controller.search('Apu');
      final filteredTitles =
          controller.filteredCharacters.map((char) => char.title);
      expect(filteredTitles, contains('Apu Nahasapeemapetilan'));
      expect(filteredTitles, isNot(contains('Homer Simpson')));
    });

    // Switching Search mode
    test('Switching search mode should update filtered Characters', () {
      // Set up the initial search mode (e.g., search by title)
      controller.searchByTitle.value = true;

      // Simulate searching with a query
      controller.search('Apu');

      // Capture the initial filtered items
      final initialFilteredItems = controller.filteredCharacters.toList();

      // Switch the search mode (e.g., search by description)
      controller.switchSearchMode(false);

      // Rebuild the widget tree after switching mode
      // (In a test, we might not have a widget tree, so we just rebuild the controller's state)
      controller.update();

      // Capture the filtered items after switching mode
      final updatedFilteredItems = controller.filteredCharacters.toList();

      // Ensure the filtered items have changed after switching search mode
      expect(updatedFilteredItems, isNot(equals(initialFilteredItems)));
    });

    // Add more tests as needed for other methods and edge cases
  });
}

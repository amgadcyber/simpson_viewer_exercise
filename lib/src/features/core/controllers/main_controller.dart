/*
  TODO: Implement Search Functionality
  search functionality that allows users to filters the character list
  to entries whose titles or descriptions contain the query text.

  Note: search works by toggling between two states
    - Search By Character's Title
    - Search By Charactes's Description
  
  To make the search show the results in both states
  The simplest way is to make this function [_getCurrentSearchMode] 
  returns <char.title + char.description;>


  Author: Amgad Fahd
  Github: https://github.com/amgadcyber
*/

import 'package:flutter/widgets.dart'
    show BuildContext, FocusNode, TextEditingController;
import 'package:get/get.dart';

import '../../../configs/configs.dart';
import '../../../repository/api_repository.dart';
import '../../../utils/logger.dart';
import '../../core.dart';

class MainController extends GetxController with StateMixin<ConnectionState> {
  static MainController get instance => Get.find();

  /// Instances
  final _apiRepo = APIRepository.instance;

  /// [characters] -- List to Store Characters
  final RxList<CharacterData> characters = <CharacterData>[].obs;

  /// Search
  final searchController = TextEditingController();
  final searchNode = FocusNode();
  final RxString searchText = ''.obs;

  /// [filteredCharacters] -- List to Store Filtered Characters - After Search
  final RxList<CharacterData> filteredCharacters = <CharacterData>[].obs;

  /// Variables
  final RxBool isVisible = false.obs;
  final RxBool searchByTitle = true.obs; // Track the current search mode

  /// [onSearchButtonPressed] -- On Press Search Button
  void onSearchButtonPressed(BuildContext context) {
    if (isVisible.isFalse) {
      // Open search field
      openSearch();
      searchNode.requestFocus();
    } else {
      // Clear && close search field
      closeSearch();
    }
  }

  /// [search] -- Perform Search based on [query],
  void search(String query) {
    searchText.value = query;
    if (query.isEmpty) {
      filteredCharacters.assignAll(characters);
    } else {
      final regex = RegExp(_buildSearchPattern(query), caseSensitive: false);
      filteredCharacters.assignAll(characters.where((char) {
        return regex.hasMatch(_getCurrentSearchMode(char));
      }));
    }
  }

  /// [_buildSearchPattern] -- Search Pattern
  String _buildSearchPattern(String query) {
    final escapedQuery = RegExp.escape(query);
    return '.*$escapedQuery.*';
  }

  /// [switchSearchMode] -- Swaitch Search Mode
  /// [searchByTitle] -- is true by default
  void switchSearchMode(bool searchByTitle) {
    this.searchByTitle.value = searchByTitle;
    // Trigger a new search when switching modes
    search(searchText.value.toLowerCase());
  }

  /// [] -- Get Current Search Mode
  String _getCurrentSearchMode(CharacterData char) {
    // return char.title.toLowerCase() + char.description.toLowerCase();
    return searchByTitle.value
        ? char.title.toLowerCase()
        : char.description.toLowerCase();
  }

  /// [openSearch] -- Open Search Field
  void openSearch() {
    isVisible.value = true;
  }

  /// [closeSearch] -- close Search Field
  void closeSearch() {
    if (searchController.text.isEmpty) {
      isVisible.value = false;
    } else {
      searchController.clear();
    }
    filteredCharacters.assignAll(characters);
  }

  @override
  void onReady() async {
    if (!Get.testMode) {
      await grepCharacters();
    }

    super.onReady();
  }

  /// [grepCharacters] -- Grep Characters
  Future<List<CharacterData>> grepCharacters() async {
    change(ConnectionState.done, status: RxStatus.success());
    try {
      final data = await _apiRepo.fetchData();
      // Simulate fetching data
      await Future.delayed(const Duration(seconds: 1));
      characters.addAll(data.relatedTopics);
      filteredCharacters.assignAll(characters);
      Logger.debugPrint(characters.length);
      if (characters.isNotEmpty) {
        change(ConnectionState.done, status: RxStatus.success());
      } else {
        change(ConnectionState.empty, status: RxStatus.empty());
      }
      return characters;
    } catch (_) {
      change(ConnectionState.failed, status: RxStatus.error(_.toString()));
      return Future.error(_);
    }
  }
}

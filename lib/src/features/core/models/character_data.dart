/*
  CharacterData Model
  This is where we do our data extraction and prepare it for the UI

  Author: Amgad Fahd
  Github: https://github.com/amgadcyber
*/

import 'package:html/parser.dart' show parseFragment;

import '../../../configs/configs.dart';

class CharacterData {
  final String firstUrl;
  final String title; // Store the extracted title
  final String description;
  final String? imageUrl;

  CharacterData({
    required this.firstUrl,
    required this.title,
    required this.description,
    this.imageUrl,
  });

  /// [fromJson] -- Read the data from the Decoded Json response
  factory CharacterData.fromJson(Map<String, dynamic> json) {
    // Extract title from the HTML link tag in the "Result" field
    final resultHtml = json['Result'];
    final resultDocument = parseFragment(resultHtml);
    final anchorElement = resultDocument.querySelector('a'); // Find the <a> tag
    final title = anchorElement?.text ?? '';

    final iconUrl = json['Icon']['URL'];
    final imageUrl = resolveImageUrl(iconUrl);

    return CharacterData(
      firstUrl: json['FirstURL'],
      title: title, // Assign the extracted title
      description: json['Text'],
      imageUrl: imageUrl,
    );
  }

  /// [resolveImageUrl] -- In case image is false, we add a placeholder image
  static String resolveImageUrl(String iconUrl) {
    if (iconUrl.isNotEmpty) {
      return 'https://duckduckgo.com$iconUrl';
    } else {
      // Placeholder image URL
      return placeHolderImage;
    }
  }
}

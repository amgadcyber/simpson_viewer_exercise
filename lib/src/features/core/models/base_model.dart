/*
  Base Model
  All data is related on this model

  Author: Amgad Fahd
  Github: https://github.com/amgadcyber
*/
import 'character_data.dart';

class BaseModel {
  final String heading;
  final String abstractSource;
  final String abstractURL;
  final List<CharacterData> relatedTopics;

  const BaseModel({
    required this.heading,
    required this.relatedTopics,
    required this.abstractSource,
    required this.abstractURL,
  });

  /// [fromJson] -- Read the data from the Decoded Json response
  factory BaseModel.fromJson(Map<dynamic, dynamic> json) {
    // Extract related topics JSON data
    List<Map<String, dynamic>> relatedTopicsJson =
        List<Map<String, dynamic>>.from(json['RelatedTopics']);

    // Create a list of SimpsonsCharacterData from the related topics JSON
    List<CharacterData> relatedTopics = relatedTopicsJson
        .map((topicJson) => CharacterData.fromJson(topicJson))
        .toList();

    return BaseModel(
      heading: json['Heading'],
      relatedTopics: relatedTopics,
      abstractSource: json['AbstractSource'],
      abstractURL: json['AbstractURL'],
    );
  }
}

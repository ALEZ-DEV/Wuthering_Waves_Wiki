import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

class Character {
  final String name;
  final String description;

  Character({
    required this.name,
    required this.description,
  });

  static Future<Character> loadFromName(String name) async {
    final file = await rootBundle.loadString('characters/$name/info.yaml');
    final info = loadYaml(file);

    return Character(
      name: info['name'],
      description: info['description'],
    );
  }

  static Future<List<String>> getList() async {
    final file = await rootBundle.loadString('characters/characters.yaml');
    final info = loadYaml(file);

    return info['list'];
  }
}

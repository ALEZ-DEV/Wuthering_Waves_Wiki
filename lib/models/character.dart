import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

class Character {
  final String name;
  final String rawName;
  final String description;
  final int star;

  //images path
  final String profile_img;
  final String presentation_img;

  //video
  final String videoDemoUrl;

  Character({
    required this.name,
    required this.rawName,
    required this.description,
    required this.star,
    required this.profile_img,
    required this.presentation_img,
    required this.videoDemoUrl,
  });

  static Future<Character> loadFromName(String name) async {
    final file = await rootBundle.loadString('characters/$name/info.yaml');
    final info = loadYaml(file);

    return Character(
      name: info['name'],
      rawName: name,
      description: info['description'],
      star: info['star'],
      profile_img: info['images']['profile'],
      presentation_img: info['images']['presentation'],
      videoDemoUrl: info['video_demo'],
    );
  }

  static Future<List<Character>> getList() async {
    final file = await rootBundle.loadString('characters/characters.yaml');
    final info = loadYaml(file);
    final strList = (info['list'] as YamlList).map((e) => e as String).toList();
    final list =
        Future.wait(strList.map((e) => Character.loadFromName(e)).toList());

    return list;
  }

  bool get isFiveStar => star == 5;

  String getImagePathOf(String imageName) {
    return 'characters/${rawName}/images/${imageName}';
  }
}

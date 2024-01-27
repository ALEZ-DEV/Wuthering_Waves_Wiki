import 'package:flutter/material.dart';
import 'package:wuthering_waves_wiki/pages/base_page.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({
    required this.characterName,
    super.key,
  });

  static const route = '/characters/:name';

  final String? characterName;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: characterName == null
          ? const Center(
              child: SelectableText('Please enter a valid character name'),
            )
          : Center(
              child: SelectableText(
                characterName!,
              ),
            ),
    );
  }
}

import 'package:flutter/material.dart';

import './base_page.dart';
import './../models/character.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({
    required this.characterName,
    super.key,
  });

  static const route = '/characters/:name';

  final String? characterName;

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  bool hasLoad = false;
  bool loading = false;
  bool hasFailed = false;
  late Character character;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (!hasLoad && widget.characterName != null) {
      loading = true;
      try {
        character = await Character.loadFromName(widget.characterName!);
      } catch (e) {
        hasFailed = true;
      }

      setState(() {
        loading = false;
      });
      hasLoad = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: widget.characterName == null
          ? const Center(
              child: SelectableText('Please enter a valid character name'),
            )
          : loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : hasFailed
                  ? const Center(
                      child: SelectableText(
                          'Failed to get info of the character, check the character name please'),
                    )
                  : Center(
                      child: SelectableText(
                        character.name,
                      ),
                    ),
    );
  }
}

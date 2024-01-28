import 'package:flutter/material.dart';
import 'package:wuthering_waves_wiki/utils.dart';

import './../widgets/character_card.dart';
import './../models/character.dart';

class CharacterGridView extends StatefulWidget {
  const CharacterGridView({super.key});

  @override
  State<CharacterGridView> createState() => _CharacterGridViewState();
}

class _CharacterGridViewState extends State<CharacterGridView> {
  bool hasLoad = false;
  bool loading = true;
  late List<Character> characterList;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    if (!hasLoad) {
      characterList = await Character.getList();
      setState(() {
        loading = false;
      });
      hasLoad = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: Utils.isMobileDevice(context)
                ? const EdgeInsets.symmetric(horizontal: 8.0)
                : const EdgeInsets.symmetric(horizontal: 50.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Utils.isMobileDevice(context) ? 2 : 5,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.5,
              ),
              itemCount: characterList.length,
              itemBuilder: (context, index) => CharacterCard(
                character: characterList[index],
              ),
            ),
          );
  }
}

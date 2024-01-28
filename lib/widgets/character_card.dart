import 'package:flutter/material.dart';

import './../models/character.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    required this.character,
    super.key,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              image: DecorationImage(
                image: AssetImage(
                  'characters/${character.rawName}/images/${character.profile_img}',
                ),
                fit: BoxFit.fitHeight,
              ),
              gradient: LinearGradient(
                colors: [
                  character.isFiveStar
                      ? Colors.yellow
                      : Colors.deepPurpleAccent,
                  Colors.transparent,
                ],
                begin: const FractionalOffset(0.0, 0.75),
                end: const FractionalOffset(0.0, 0.0),
                stops: const [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
        ),
        SelectableText(
          character.name,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

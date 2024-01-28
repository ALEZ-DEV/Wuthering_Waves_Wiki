import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import './../models/character.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    required this.character,
    required this.canClick,
    super.key,
  });

  final Character character;
  final bool canClick;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: canClick
                  ? () => context.go('/characters/${character.rawName}')
                  : null,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  image: DecorationImage(
                    image: character.getImagePathOf(character.profile_img),
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

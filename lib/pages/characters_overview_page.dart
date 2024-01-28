import 'package:flutter/material.dart';

import './../widgets/character_grid_view.dart';

import 'base_page.dart';

class CharactersOverviewPage extends StatelessWidget {
  const CharactersOverviewPage({super.key});

  static const route = '/characters';

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            'Characters overview',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Divider(),
          const CharacterGridView(),
        ],
      ),
    );
  }
}

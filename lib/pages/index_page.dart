import 'package:flutter/material.dart';

import './../widgets/character_grid_view.dart';

import 'base_page.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SelectableText(
            'Wuthering Waves Wiki',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const Divider(),
          const CharacterGridView(),
        ],
      ),
    );
  }
}

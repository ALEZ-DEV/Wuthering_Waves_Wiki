import 'package:flutter/material.dart';

import 'base_page.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Center(
        child: Column(
          children: [
            SelectableText(
              'Welcome the to Wuthering Waves Wiki !',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

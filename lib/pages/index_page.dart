import 'package:flutter/material.dart';

import 'base_page.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      child: Center(
        child: SelectableText('This is a web test'),
      ),
    );
  }
}

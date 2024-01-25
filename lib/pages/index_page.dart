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

class SuperPage extends StatelessWidget {
  const SuperPage({
    super.key,
  });

  static const route = '/super';

  @override
  Widget build(BuildContext context) {
    return BasePage(
      child: Container(
        color: Theme.of(context).colorScheme.background,
        child: const Center(
          child: SelectableText('This is a super web test'),
        ),
      ),
    );
  }
}

class LotOfContentPage extends StatelessWidget {
  LotOfContentPage({super.key});

  static const route = '/lot-of-content';

  List<Widget> listOfWidgets = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 25; i++) {
      listOfWidgets.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.blue,
          height: 50,
          child: Center(
            child: Text('content nb$i'),
          ),
        ),
      ));
    }

    return BasePage(
      child: Column(
        children: listOfWidgets,
      ),
    );
  }
}

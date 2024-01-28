import 'package:flutter/material.dart';

import 'package:wuthering_waves_wiki/utils.dart';

class BasePage extends StatelessWidget {
  const BasePage({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final paddingSize = Utils.isMobileDevice(context) ? 0.0 : 100.0;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: paddingSize,
          right: paddingSize,
        ),
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height - paddingSize,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: Utils.isMobileDevice(context)
                ? null
                : const BorderRadius.only(
                    topRight: Radius.circular(15.0),
                  ),
          ),
          child: Padding(
            padding: Utils.isMobileDevice(context)
                ? const EdgeInsets.all(15.0)
                : const EdgeInsets.symmetric(horizontal: 150.0, vertical: 15.0),
            child: child,
          ),
        ),
      ),
    );
  }
}

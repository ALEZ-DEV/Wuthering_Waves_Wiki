import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

import 'package:wuthering_waves_wiki/routes.dart';
import 'package:wuthering_waves_wiki/theme.dart' as WutheringWaves;

void main() {
  usePathUrlStrategy();
  runApp(const WutheringWavesApp());
}

class WutheringWavesApp extends StatelessWidget {
  const WutheringWavesApp({super.key});

  @override
  Widget build(BuildContext context) {
    WutheringWaves.Theme.setCurrentMode(context);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: Routing.router,
      themeMode: WutheringWaves.Theme.currentMode,
      theme: WutheringWaves.Theme.light,
      darkTheme: WutheringWaves.Theme.dark,
    );
  }
}

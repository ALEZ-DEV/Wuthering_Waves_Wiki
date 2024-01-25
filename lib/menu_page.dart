import 'dart:math';

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import 'package:wuthering_waves_wiki/utils.dart';

//Redirect to the correct page format
class MenuPage extends StatefulWidget {
  const MenuPage({
    required this.child,
    required this.uri,
    required this.allRoutes,
    super.key,
  });

  final Widget child;
  final Uri uri;
  final List<String> allRoutes;

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    final selectedPage = widget.allRoutes.indexOf(widget.uri.path);

    return Utils.isMobileDevice(context)
        ? MenuMobilePage(
            selectedPage: selectedPage,
            allRoutes: widget.allRoutes,
            child: widget.child,
          )
        : MenuDesktopPage(
            selectedPage: selectedPage,
            allRoutes: widget.allRoutes,
            child: widget.child,
          );
  }
}

class MenuDesktopPage extends StatefulWidget {
  const MenuDesktopPage({
    required this.selectedPage,
    required this.allRoutes,
    required this.child,
    super.key,
  });

  final int selectedPage;
  final List<String> allRoutes;
  final Widget child;

  @override
  State<MenuDesktopPage> createState() => _MenuDesktopPageState();
}

//The menu for a desktop page
class _MenuDesktopPageState extends State<MenuDesktopPage> {
  late int selectedBackground;

  @override
  void initState() {
    selectedBackground = Random().nextInt(4 - 1) + 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.asset(
            'assets/images/wutheringwaves_gallery$selectedBackground.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Row(
          children: [
            NavigationRail(
              selectedIndex: widget.selectedPage,
              onDestinationSelected: (int index) {
                context.go(widget.allRoutes[index]);
              },
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.abc),
                  label: Text('index page'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.abc),
                  label: Text('super page'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.abc),
                  label: Text('lot of content'),
                ),
              ],
            ),
            Expanded(
              child: widget.child,
            ),
          ],
        ),
      ],
    );
  }
}

//The menu for a mobile page
class MenuMobilePage extends StatefulWidget {
  const MenuMobilePage({
    required this.selectedPage,
    required this.allRoutes,
    required this.child,
    super.key,
  });

  final int selectedPage;
  final List<String> allRoutes;
  final Widget child;

  @override
  State<MenuMobilePage> createState() => _MenuMobilePageState();
}

class _MenuMobilePageState extends State<MenuMobilePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: widget.child,
        ),
        NavigationBar(
          selectedIndex: widget.selectedPage,
          onDestinationSelected: (int index) {
            context.go(widget.allRoutes[index]);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.abc),
              label: 'index page',
            ),
            NavigationDestination(
              icon: Icon(Icons.abc),
              label: 'super page',
            ),
            NavigationDestination(
              icon: Icon(Icons.abc),
              label: 'lot of content',
            ),
          ],
        ),
      ],
    );
  }
}

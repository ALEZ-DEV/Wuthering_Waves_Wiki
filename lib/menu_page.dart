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
    final notHaveSelectedpage = !widget.allRoutes.contains(widget.uri.path);
    int selectedPage = widget.allRoutes.indexOf(widget.uri.path);
    if (notHaveSelectedpage) selectedPage = widget.allRoutes.length;

    return Utils.isMobileDevice(context)
        ? MenuMobilePage(
            notHaveSelectedPage: notHaveSelectedpage,
            selectedPage: selectedPage,
            allRoutes: widget.allRoutes,
            child: widget.child,
          )
        : MenuDesktopPage(
            notHaveSelectedPage: notHaveSelectedpage,
            selectedPage: selectedPage,
            allRoutes: widget.allRoutes,
            child: widget.child,
          );
  }
}

class MenuDesktopPage extends StatefulWidget {
  const MenuDesktopPage({
    required this.notHaveSelectedPage,
    required this.selectedPage,
    required this.allRoutes,
    required this.child,
    super.key,
  });

  final bool notHaveSelectedPage;
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
                if (widget.allRoutes[index] == '/characters/:name') {
                  context.go('/characters/yinlin');
                  return;
                }
                context.go(widget.allRoutes[index]);
              },
              destinations: [
                const NavigationRailDestination(
                  icon: Icon(Icons.abc),
                  label: Text('index page'),
                ),
                const NavigationRailDestination(
                  icon: Icon(Icons.abc),
                  label: Text('character page'),
                ),
                if (widget.notHaveSelectedPage)
                  const NavigationRailDestination(
                    icon: Icon(Icons.more_horiz),
                    label: Text('other'),
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
    required this.notHaveSelectedPage,
    required this.selectedPage,
    required this.allRoutes,
    required this.child,
    super.key,
  });

  final bool notHaveSelectedPage;
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
            if (widget.allRoutes[index] == '/characters/:name') {
              context.go('/characters/yinlin');
              return;
            }
            context.go(widget.allRoutes[index]);
          },
          destinations: [
            const NavigationDestination(
              icon: Icon(Icons.abc),
              label: 'index page',
            ),
            const NavigationDestination(
              icon: Icon(Icons.abc),
              label: 'character page',
            ),
            if (widget.notHaveSelectedPage)
              const NavigationDestination(
                icon: Icon(Icons.more_horiz),
                label: 'other',
              ),
          ],
        ),
      ],
    );
  }
}

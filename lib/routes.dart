import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'menu_page.dart';
import './pages/index_page.dart';
import './pages/character_page.dart';

class Routing {
  static const allRoutes = [
    IndexPage.route,
    CharacterPage.route,
  ];

  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        routes: [
          GoRoute(
            path: IndexPage.route,
            pageBuilder: (context, state) => buildPage(
              context,
              state,
              const IndexPage(),
            ),
          ),
          GoRoute(
            path: CharacterPage.route,
            pageBuilder: (context, state) => buildPage(
              context,
              state,
              CharacterPage(
                characterName: state.pathParameters['name'],
              ),
            ),
          ),
        ],
        builder: (context, state, child) => MenuPage(
          uri: state.uri,
          allRoutes: allRoutes,
          child: child,
        ),
      ),
    ],
  );

  static Page<dynamic> buildPage(
          BuildContext context, GoRouterState state, Widget child) =>
      CustomTransitionPage(
        key: state.pageKey,
        //transitionDuration: const Duration(milliseconds: 500),
        //reverseTransitionDuration: const Duration(milliseconds: 500),
        child: child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      );
}

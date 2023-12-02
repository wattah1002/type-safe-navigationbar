import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_go_router/main.dart';
import 'package:recipe_go_router/scaffold_with_navigation.dart';

part 'router.g.dart';

@TypedShellRoute<MyShellRouteData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<AlphaRouteData>(path: '/alpha'),
    TypedGoRoute<BetaRouteData>(
      path: '/beta',
      routes: <TypedGoRoute<AlphaDetailsRouteData>>[
        TypedGoRoute<AlphaDetailsRouteData>(path: 'details')
      ],
    ),
  ],
)
class MyShellRouteData extends ShellRouteData {
  const MyShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    Widget navigator,
  ) {
    return ScaffoldWithNavigation(child: navigator);
  }
}

class AlphaRouteData extends GoRouteData {
  const AlphaRouteData();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) =>
      const AlphaPage();
}

class AlphaDetailsRouteData extends GoRouteData {
  const AlphaDetailsRouteData();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) =>
      const AlphaDetailsPage();
}

class BetaRouteData extends GoRouteData {
  const BetaRouteData();

  @override
  Widget build(
    BuildContext context,
    GoRouterState state,
  ) =>
      const BetaPage();
}

final router = GoRouter(
  routes: $appRoutes,
  initialLocation: '/alpha',
);

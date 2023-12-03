import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_go_router/main.dart';

part 'typed_shell_route_demo.g.dart';

class TypedShellRouteDemo extends StatelessWidget {
  const TypedShellRouteDemo({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GoRouter Recipe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}

class ScaffoldWithNavigation extends StatelessWidget {
  const ScaffoldWithNavigation({
    required this.child,
    super.key,
  });

  final Widget child;

  int getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location == '/beta') {
      return 1;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = getCurrentIndex(context);
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Alpha',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Beta',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              const AlphaRouteData().go(context);
              break;
            case 1:
              const BetaRouteData().go(context);
              break;
          }
        },
      ),
    );
  }
}

// Router
@TypedShellRoute<MyShellRouteData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<AlphaRouteData>(
      path: '/alpha',
      routes: <TypedGoRoute<AlphaDetailsRouteData>>[
        TypedGoRoute<AlphaDetailsRouteData>(path: 'details')
      ],
    ),
    TypedGoRoute<BetaRouteData>(
      path: '/beta',
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

final _router = GoRouter(
  routes: $appRoutes,
  initialLocation: '/alpha',
);

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'typed_stateful_shell_route_demo.g.dart';

class TypedStatefulShellRouteDemo extends StatelessWidget {
  const TypedStatefulShellRouteDemo({super.key});

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

// Router
final _shellNavigatorAlphaKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellAlpha');
final _shellNavigatorBetaKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellBeta');

@TypedStatefulShellRoute<MyStatefulShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<BranchAlphaData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<AlphaRouteData>(
          path: '/alpha',
          routes: <TypedRoute<RouteData>>[
            TypedGoRoute<AlphaDetailsRouteData>(path: 'details')
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<BranchBetaData>(
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<BetaRouteData>(path: '/beta'),
      ],
    ),
  ],
)
class MyStatefulShellRouteData extends StatefulShellRouteData {
  const MyStatefulShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return navigationShell;
  }

  static const String $restorationScopeId = 'restorationScopeId';

  static Widget $navigatorContainerBuilder(
    BuildContext context,
    StatefulNavigationShell navigationShell,
    List<Widget> children,
  ) {
    return ScaffoldWithNavigation(
      navigationShell: navigationShell,
      children: children,
    );
  }
}

class BranchAlphaData extends StatefulShellBranchData {
  const BranchAlphaData();

  static final GlobalKey<NavigatorState> $navigatorKey =
      _shellNavigatorAlphaKey;
  static const String $restorationScopeId = 'restorationScopeId';
}

class BranchBetaData extends StatefulShellBranchData {
  const BranchBetaData();

  static final GlobalKey<NavigatorState> $navigatorKey = _shellNavigatorBetaKey;
  static const String $restorationScopeId = 'restorationScopeId';
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

class ScaffoldWithNavigation extends StatelessWidget {
  const ScaffoldWithNavigation({
    required this.navigationShell,
    required this.children,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavigation'));

  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => _onTap,
      ),
    );
  }

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

final _router = GoRouter(
  routes: $appRoutes,
  initialLocation: '/alpha',
);

// Typical page
class AlphaPage extends StatelessWidget {
  const AlphaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alpha Page'),
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            const AlphaDetailsRouteData().push(context);
          },
          child: const Text('View details'),
        ),
      ),
    );
  }
}

class AlphaDetailsPage extends StatelessWidget {
  const AlphaDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alpha Details Page'),
      ),
      body: Container(),
    );
  }
}

class BetaPage extends StatelessWidget {
  const BetaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beta Page'),
      ),
      body: Container(),
    );
  }
}

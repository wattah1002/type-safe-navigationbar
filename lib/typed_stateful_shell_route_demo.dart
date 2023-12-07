import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'typed_stateful_shell_route_demo.g.dart';

void main() => runApp(const TypedStatefulShellRouteDemo());

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
@TypedStatefulShellRoute<MyStatefulShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<BranchAlphaData>(
      routes: [
        TypedGoRoute<AlphaRouteData>(
          path: '/alpha',
          routes: [
            TypedGoRoute<AlphaDetailsRouteData>(path: 'details'),
          ],
        ),
      ],
    ),
    TypedStatefulShellBranch<BranchBetaData>(
      routes: [
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
    return ScaffoldWithNavigation(navigationShell: navigationShell);
  }
}

class BranchAlphaData extends StatefulShellBranchData {
  const BranchAlphaData();
}

class BranchBetaData extends StatefulShellBranchData {
  const BranchBetaData();
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
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Alpha',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: 'Beta',
          ),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

final _router = GoRouter(
  initialLocation: '/alpha',
  routes: $appRoutes,
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

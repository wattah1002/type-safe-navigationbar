import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'typed_shell_route_demo.g.dart';

void main() => runApp(const TypedShellRouteDemo());

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
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
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
        onDestinationSelected: (int index) {
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
      routes: <TypedRoute<RouteData>>[
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

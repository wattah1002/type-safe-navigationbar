import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:recipe_go_router/router.dart';

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

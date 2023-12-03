import 'package:flutter/material.dart';
import 'package:recipe_go_router/typed_shell_route_demo.dart';

void main() {
  runApp(const TypedShellRouteDemo());
}

// Common page
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

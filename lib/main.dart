import 'package:flutter/material.dart';
import 'package:recipe_go_router/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'GoRouter Recipe',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: router,
    );
  }
}

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

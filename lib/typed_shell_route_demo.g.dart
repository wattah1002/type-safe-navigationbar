// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'typed_shell_route_demo.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $myShellRouteData,
    ];

RouteBase get $myShellRouteData => ShellRouteData.$route(
      factory: $MyShellRouteDataExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/alpha',
          factory: $AlphaRouteDataExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'details',
              factory: $AlphaDetailsRouteDataExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: '/beta',
          factory: $BetaRouteDataExtension._fromState,
        ),
      ],
    );

extension $MyShellRouteDataExtension on MyShellRouteData {
  static MyShellRouteData _fromState(GoRouterState state) =>
      const MyShellRouteData();
}

extension $AlphaRouteDataExtension on AlphaRouteData {
  static AlphaRouteData _fromState(GoRouterState state) =>
      const AlphaRouteData();

  String get location => GoRouteData.$location(
        '/alpha',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AlphaDetailsRouteDataExtension on AlphaDetailsRouteData {
  static AlphaDetailsRouteData _fromState(GoRouterState state) =>
      const AlphaDetailsRouteData();

  String get location => GoRouteData.$location(
        '/alpha/details',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BetaRouteDataExtension on BetaRouteData {
  static BetaRouteData _fromState(GoRouterState state) => const BetaRouteData();

  String get location => GoRouteData.$location(
        '/beta',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

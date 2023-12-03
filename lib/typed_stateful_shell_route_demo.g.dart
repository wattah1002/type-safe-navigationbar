// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'typed_stateful_shell_route_demo.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $myStatefulShellRouteData,
    ];

RouteBase get $myStatefulShellRouteData => StatefulShellRouteData.$route(
      restorationScopeId: MyStatefulShellRouteData.$restorationScopeId,
      navigatorContainerBuilder:
          MyStatefulShellRouteData.$navigatorContainerBuilder,
      factory: $MyStatefulShellRouteDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          navigatorKey: BranchAlphaData.$navigatorKey,
          restorationScopeId: BranchAlphaData.$restorationScopeId,
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
          ],
        ),
        StatefulShellBranchData.$branch(
          navigatorKey: BranchBetaData.$navigatorKey,
          restorationScopeId: BranchBetaData.$restorationScopeId,
          routes: [
            GoRouteData.$route(
              path: '/beta',
              factory: $BetaRouteDataExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $MyStatefulShellRouteDataExtension on MyStatefulShellRouteData {
  static MyStatefulShellRouteData _fromState(GoRouterState state) =>
      const MyStatefulShellRouteData();
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

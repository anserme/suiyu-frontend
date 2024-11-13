import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../main.dart';
import '../../screen/home/home_screen.dart';
import '../../screen/loginOrRegister/login_screen.dart';

enum AppRoute {
  login,
  home,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(initialLocation: '/', debugLogDiagnostics: true, routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) =>  HomeScreen(),
    )
  ]);
});

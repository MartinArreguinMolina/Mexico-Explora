

import 'package:go_router/go_router.dart';

import '../../presentation/screens/screens.dart';


class AppRouter{
  final goRoute = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomeScreen(),
      ),
    ]
  );
}
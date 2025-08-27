import 'package:go_router/go_router.dart';
import '../views/main/main_screen.dart';

class AppRouterGo {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MainScreen(),
      ),
    ],
  );
}

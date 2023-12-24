import 'package:cinemapedia/presentation/screens/screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: HomeScreen.routeName, routes: [
  GoRoute(
    path: HomeScreen.routeName,
    builder: (context, state) => const HomeScreen(),
  ),
]);

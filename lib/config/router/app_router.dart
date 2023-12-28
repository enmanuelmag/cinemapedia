import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/presentation/screens/screen.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: HomeScreen.routeName, routes: [
  GoRoute(
      path: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: '${MovieScreen.routeName}/:movieId',
          builder: (context, state) => MovieScreen(
            movieId: state.pathParameters['movieId'] ?? Environment.noMovieId,
          ),
        ),
      ]),
]);

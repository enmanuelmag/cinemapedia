import 'package:go_router/go_router.dart';

import 'package:cinemapedia/presentation/views/views.dart';
import 'package:cinemapedia/presentation/screens/screen.dart';
import 'package:cinemapedia/config/constants/environment.dart';

final appRouter = GoRouter(
  initialLocation: HomeView.routeName,
  routes: [
    GoRoute(
      path: '/home/:page',
      builder: (context, state) =>
          HomeScreen(int.tryParse(state.pathParameters['page'] ?? '0') ?? 0),
      routes: [
        GoRoute(
          path: '${MovieScreen.routeName}/:movieId',
          builder: (context, state) => MovieScreen(
            movieId: state.pathParameters['movieId'] ?? Environment.noMovieId,
          ),
        ),
      ],
    ),
    GoRoute(
      path: '/',
      redirect: (_, __) => '/home/0',
    )
  ],
);

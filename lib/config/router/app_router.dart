import 'package:go_router/go_router.dart';

import 'package:cinemapedia/presentation/views/views.dart';
import 'package:cinemapedia/presentation/screens/screen.dart';
import 'package:cinemapedia/config/constants/environment.dart';

final appRouter = GoRouter(
  initialLocation: HomeView.routeName,
  routes: [
    ShellRoute(
      builder: (context, state, child) => HomeScreen(childView: child),
      routes: [
        GoRoute(
            path: HomeView.routeName,
            builder: (context, state) => const HomeView(),
            routes: [
              GoRoute(
                path: '${MovieScreen.routeName}/:movieId',
                builder: (context, state) => MovieScreen(
                  movieId:
                      state.pathParameters['movieId'] ?? Environment.noMovieId,
                ),
              ),
            ]),
        GoRoute(
          path: FavoritesView.routeName,
          builder: (context, state) => const FavoritesView(),
        ),
        GoRoute(
          path: CategoriesView.routeName,
          builder: (context, state) => const CategoriesView(),
        ),
      ],
    ),
  ],
);

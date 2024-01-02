import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/screens/screen.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';

class CustomAppBar extends ConsumerWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
              width: double.infinity,
              child: Row(
                children: [
                  Icon(Icons.movie_outlined, color: colors.primary),
                  const SizedBox(width: 10),
                  Text(
                    'Cinemapedia',
                    style: titleStyle,
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        final searchMoviesNotifier =
                            ref.read(searchMoviesProvider.notifier);
                        final searchMovies = ref.read(searchMoviesProvider);
                        final searchQuery = ref.read(searchQueryProvider.notifier);

                        showSearch<Movie?>(
                                query: searchQuery.state,
                                context: context,
                                delegate: SearchMovieDelegate(
                                    initialMovies: searchMovies,
                                    searchMovies: searchMoviesNotifier.searchMoviesByQuery))
                            .then((movie) => {
                                  if (movie != null)
                                    {
                                      context.push(
                                          '/${MovieScreen.routeName}/${movie.id}}')
                                    }
                                });
                      },
                      icon: const Icon(Icons.search)),
                ],
              )),
        ));
  }
}

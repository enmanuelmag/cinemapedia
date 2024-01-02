import 'dart:async';

import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:cinemapedia/domain/entities/movie.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMoviesCallback searchMovies;
  List<Movie> initialMovies;

  Timer? debounceTimer;
  StreamController<bool> isLoading = StreamController.broadcast();
  StreamController<List<Movie>> debounceMovies = StreamController.broadcast();

  SearchMovieDelegate({
    required this.searchMovies,
    this.initialMovies = const [],
  });

  void _onQueryChanged(String query) {
    isLoading.add(true);
    if (debounceTimer?.isActive ?? false) {
      debounceTimer?.cancel();
    }
    debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      final movies = await searchMovies(query);
      isLoading.add(false);
      debounceMovies.add(movies);
      initialMovies = movies;
    });
  }

  void clearStreams() {
    isLoading.close();
    debounceMovies.close();
  }

  @override
  String? get searchFieldLabel => 'Search movie';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
          initialData: false,
          stream: isLoading.stream,
          builder: (context, snapshot) => snapshot.data ?? false
              ? SpinPerfect(
                  infinite: true,
                  duration: const Duration(seconds: 1),
                  child: IconButton(
                      onPressed: () => query = '',
                      icon: const Icon(Icons.refresh_rounded)))
              : FadeIn(
                  animate: query.isNotEmpty,
                  duration: const Duration(milliseconds: 150),
                  child: IconButton(
                      onPressed: () => query = '',
                      icon: const Icon(Icons.clear_rounded))))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          clearStreams();
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_ios_new_rounded));
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildResultAndSuggestions();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);
    return buildResultAndSuggestions();
  }

  Widget buildResultAndSuggestions() {
    return StreamBuilder(
      initialData: initialMovies,
      stream: debounceMovies.stream,
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];
        return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) => _MovieItem(
                  movie: movies[index],
                  onMovieSelected: (contextParam, movie) {
                    clearStreams();
                    close(contextParam, movie);
                  },
                ));
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;
  final Function onMovieSelected;

  const _MovieItem({required this.movie, required this.onMovieSelected});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textStyles = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => onMovieSelected(context, movie),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Image
              SizedBox(
                width: size.width * 0.2,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    movie.posterPath,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress != null) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return FadeInRight(
                        child: child,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 10),
              //Description
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      movie.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: textStyles.titleMedium,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      movie.overview,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: textStyles.bodyMedium,
                    ),
                    Row(
                      children: [
                        Icon(Icons.star_half_rounded,
                            color: Colors.yellow.shade800),
                        const SizedBox(width: 5),
                        Text(
                          HumanFormats.formatNumber(movie.voteAverage,
                              decimals: 1),
                          style: textStyles.bodyMedium!
                              .copyWith(color: Colors.yellow.shade900),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:cinemapedia/domain/entities/movie.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMoviesCallback searchMovies;

  SearchMovieDelegate({required this.searchMovies});

  @override
  String? get searchFieldLabel => 'Search movie';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      FadeIn(
          animate: query.isNotEmpty,
          duration: const Duration(milliseconds: 150),
          child: IconButton(
              onPressed: () => query = '',
              icon: const Icon(Icons.clear_rounded)))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back_ios_new_rounded));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('Build Results');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
      future: searchMovies(query),
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];
        return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) => _MovieItem(movie: movies[index]));
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;

  const _MovieItem({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Placeholder();
  }
}

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/presentation/providers/providers.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

final searchMoviesProvider =
    StateNotifierProvider<SearchMoviesNotifier, List<Movie>>((ref) {

  final searchMovies = ref.read(movieRepositoryProvider).searchMovies;
  
  return SearchMoviesNotifier(
    ref: ref,
    searchMovies: searchMovies,
  );
});

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMoviesNotifier extends StateNotifier<List<Movie>> {
  final SearchMoviesCallback _searchMovies;
  final Ref ref;

  SearchMoviesNotifier({
    required this.ref,
    required SearchMoviesCallback searchMovies,
  })  : _searchMovies = searchMovies,
        super([]);

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    if (query.isEmpty) {
      return [];
    }

    ref.read(searchQueryProvider.notifier).update((state) => query);

    final movies = await _searchMovies(query);
    state = movies;
    return movies;
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';

final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesNotifier(fetchMoreMovies);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int _page = 1;
  MovieCallback _movieCallback;

  MoviesNotifier(
    this._movieCallback,
  ) : super([]);

  Future<void> loadNextPage() async {
    _page++;

    final movies = await _movieCallback(page: _page);
    state = [...state, ...movies];
  }
}

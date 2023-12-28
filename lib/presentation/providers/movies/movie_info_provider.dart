

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final getMovie = ref.watch(movieRepositoryProvider).getMovieById;
  return MovieMapNotifier(getMovie);
});

typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback _movieCallback;

  MovieMapNotifier(this._movieCallback) : super({});

  Future<void> loadMovie(String movieId, {bool force = false}) async {
    if (!force && state.containsKey(movieId)) return;

    final movie = await _movieCallback(movieId);

    state = {
      ...state,
      movieId: movie,
    };
  }
}

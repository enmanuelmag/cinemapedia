

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

typedef MovieState = Map<String, Movie>;
typedef GetMovieCallback = Future<Movie> Function(String movieId);

final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, MovieState>((ref) {
  final getMovie = ref.watch(movieRepositoryProvider).getMovieById;
  return MovieMapNotifier(getMovie);
});


class MovieMapNotifier extends StateNotifier<MovieState> {
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

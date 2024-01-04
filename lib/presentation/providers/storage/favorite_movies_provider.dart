import 'package:cinemapedia/domain/repositories/local_store_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

typedef State = Map<int, Movie>;

final favoriteMoviesProvider =
    StateNotifierProvider<StorageMovieNotifier, State>(
  (ref) => StorageMovieNotifier(ref.watch(localStorageProvider)),
);

class StorageMovieNotifier extends StateNotifier<State> {
  int _page = 0;
  final LocalStorageRepository _localStorageRepository;

  StorageMovieNotifier(this._localStorageRepository) : super({});

  Future<int> loadNextPage() async {
    final movies = await _localStorageRepository.loadMovies(offset: _page * 20);

    _page++;
    state = {...state, for (final movie in movies) movie.id: movie};

    return movies.length;
  }

  Future<bool> toggleFavorite(Movie movie) async {
    final isFavorite = await _localStorageRepository.toggleFavorite(movie);
    if (isFavorite) {
      state = {...state, movie.id: movie};
    } else {
      state.remove(movie.id);
      state = {...state};
    }
    return isFavorite;
  }
}

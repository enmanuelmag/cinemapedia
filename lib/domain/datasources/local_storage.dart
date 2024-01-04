import 'package:cinemapedia/domain/entities/movie.dart';

abstract class LocalStorageDatasource {
  Future<bool> toggleFavorite(Movie movieId);

  Future<bool> isFavorite(int movieId);

  Future<List<Movie>> loadMovies({int limit = 20, int offset = 1});
}

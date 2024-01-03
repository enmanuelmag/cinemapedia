import 'package:cinemapedia/domain/datasources/local_storage.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

abstract class LocalStorageRepository {
  late final LocalStorageDatasource datasource;

  Future<bool> toggleFavorite(Movie movie);

  Future<bool> isFavorite(int movieId);

  Future<List<Movie>> loadMovies({int limit = 10, int offset = 1});
}

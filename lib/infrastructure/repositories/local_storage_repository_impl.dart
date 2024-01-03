import 'package:cinemapedia/domain/datasources/local_storage.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_store_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  LocalStorageRepositoryImpl(LocalStorageDatasource datasource) {
    this.datasource = datasource;
  }

  @override
  Future<bool> isFavorite(int movieId) => datasource.isFavorite(movieId);

  @override
  Future<List<Movie>> loadMovies({int limit = 10, int offset = 1}) =>
      datasource.loadMovies(limit: limit, offset: offset);

  @override
  Future<bool> toggleFavorite(Movie movie) => datasource.toggleFavorite(movie);
}

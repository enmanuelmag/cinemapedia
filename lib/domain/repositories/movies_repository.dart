import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MovieRepository {
  late final MoviesDataSource dataSource;

  Future<List<Movie>> getPopular({int page = 1});

  Future<List<Movie>> getNowPlaying({int page = 1});
}
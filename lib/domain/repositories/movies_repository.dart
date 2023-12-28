import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesRepository {
  late final MoviesDataSource dataSource;

  Future<List<Movie>> getPopular({int page = 1});

  Future<List<Movie>> getNowPlaying({int page = 1});

  Future<List<Movie>> getUpcoming({int page = 1});

  Future<List<Movie>> getTopRated({int page = 1});

  Future<Movie> getMovieById(String id);
}

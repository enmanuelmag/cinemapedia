import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDataSource {
  Future<List<Movie>> getPopular({int page = 1});

  Future<List<Movie>> getNowPlaying({int page = 1});
}
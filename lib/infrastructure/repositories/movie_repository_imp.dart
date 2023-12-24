import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MovieRepositoryImp implements MoviesRepository {
  @override
  late final MoviesDataSource dataSource;

  MovieRepositoryImp(this.dataSource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async =>
      dataSource.getNowPlaying(page: page);

  @override
  Future<List<Movie>> getPopular({int page = 1}) async =>
      dataSource.getPopular(page: page);
}
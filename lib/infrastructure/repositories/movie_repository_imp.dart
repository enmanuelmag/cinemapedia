import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MovieRepositoryImp extends MoviesRepository {

  MovieRepositoryImp(MoviesDataSource dataSource) {
    this.dataSource = dataSource;
  }

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async =>
      dataSource.getNowPlaying(page: page);

  @override
  Future<List<Movie>> getPopular({int page = 1}) async =>
      dataSource.getPopular(page: page);

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async =>
      dataSource.getTopRated(page: page);

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async =>
      dataSource.getUpcoming(page: page);

  @override
  Future<Movie> getMovieById(String id) async => dataSource.getMovieById(id);
}

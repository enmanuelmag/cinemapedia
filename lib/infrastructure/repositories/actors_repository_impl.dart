import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';

class ActorRepositoryImpl extends ActorsRepository {
  ActorRepositoryImpl(ActorsDataSource dataSource) {
    this.dataSource = dataSource;
  }

  @override
  Future<List<Actor>> getActorsByMovieId(String movieId) async =>
      dataSource.getActorsByMovieId(movieId);
}

import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';

abstract class ActorsRepository {
  late final ActorsDataSource dataSource;

  Future<List<Actor>> getActorsByMovieId(String movieId);
}
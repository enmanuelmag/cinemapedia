import 'package:cinemapedia/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/actors_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


// This provider is inmutable, just for read data
final actorRepositoryProvider =
    Provider((ref) => ActorRepositoryImpl(ActorMovieDbDatasource()));

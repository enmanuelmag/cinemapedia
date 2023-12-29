import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';
import 'package:dio/dio.dart';

import 'package:cinemapedia/config/constants/environment.dart';

class ActorMovieDbDatasource implements ActorsDataSource {
  final dio = Dio(BaseOptions(baseUrl: Environment.baseUrl, queryParameters: {
    'api_key': Environment.movieDbKey,
    'language': 'en-US',
  }));

  @override
  Future<List<Actor>> getActorsByMovieId(String movieId) async {
    final response = await dio.get(
      '/movie/$movieId/credits',
    );
    if (response.statusCode != 200) {
      throw Exception('Actors not found on movie $movieId');
    }

    return CreditsResponse.fromJson(response.data)
        .cast
        .map(ActorMapper.castToEntity)
        .toList();
  }
}

import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast json) => Actor(
        id: json.id,
        name: json.name,
        character: json.character,
        profilePath: json.profilePath != null
            ? '${Environment.imageUrl}/${json.profilePath}'
            : 'https://cdn11.bigcommerce.com/s-nq6l4syi/images/stencil/1280x1280/products/3273/758758/29796-1024__56014.1670458178.jpg?c=2?imbypass=on',
      );
}

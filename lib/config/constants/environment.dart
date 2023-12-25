import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static final String movieDbKey =
      dotenv.get('THE_MOVIEDB_KEY', fallback: 'No key found');

  static final String baseUrl = dotenv.get('BASE_URL',
      fallback: 'No base url found, please check your .env file');

  static final String imageUrl = dotenv.get('IMAGES_URL',
      fallback: 'No image url found, please check your .env file');
}

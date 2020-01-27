import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:plantpedia/src/redux/store.dart';

final kBaseUrl = DotEnv().env['API_HOST'];
final kApiToken = DotEnv().env['API_TOKEN'];

class PlantRepository {
  static Future<http.Response> getPlants({int page = 1}) {
    String token = store.state.authState.token;

    return http.get(
      '$kBaseUrl/species.json?page=$page',
      headers: {
        'authorization': token,
      },
    );
  }

  static Future<http.Response> getPlant(int id) {
    String token = store.state.authState.token;

    return http.get(
      '$kBaseUrl/species/$id.json',
      headers: {
        'authorization': token,
      },
    );
  }
}

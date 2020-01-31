import 'package:http/http.dart' as http;
import 'package:plantpedia/src/redux/store.dart';
import 'package:plantpedia/src/utils/env.dart';

final kBaseUrl = Env.get('API_HOST');

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

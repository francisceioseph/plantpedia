import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

final kBaseUrl = DotEnv().env['API_HOST'];
final kApiToken = DotEnv().env['API_TOKEN'];

class PlantRepository {
  static Future<http.Response> getPlants({int page = 1}) {
    return http.get('$kBaseUrl/species.json?page=$page');
  }

  static Future<http.Response> getPlant(int id) {
    return http.get('$kBaseUrl/species/$id.json');
  }
}

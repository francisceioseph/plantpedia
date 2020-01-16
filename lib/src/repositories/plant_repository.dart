import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

const kBaseUrl = 'https://trefle.io/api';
final kApiToken = DotEnv().env['API_TOKEN'];

class PlantRepository {
  static Future<http.Response> getPlants() {
    return http.get('$kBaseUrl/plants?token=$kApiToken&page_size=30&page=1');
  }

  static Future<http.Response> getPlant(int id) {
    return http.get('$kBaseUrl/plants/$id?token=$kApiToken');
  }
}

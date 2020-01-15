import 'package:http/http.dart' as http;

const kBaseUrl = 'https://trefle.io/api';

class PlantRepository {
  static Future<http.Response> getPlants() {
    return http.get('$kBaseUrl/plants?token=token&page_size=10&page=10');
  }

  static Future<http.Response> getPlant(int id) {
    return http.get('$kBaseUrl/plants/$id?token=token');
  }
}

import 'package:http/http.dart' as http;

const kBaseUrl = 'http://10.0.2.2:3000';

class PlantRepository {
  static Future<http.Response> getPlants() {
    return http.get('$kBaseUrl/plants');
  }
}

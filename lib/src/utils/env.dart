import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static get(String key) {
    return DotEnv().env['API_HOST'];
  }
}

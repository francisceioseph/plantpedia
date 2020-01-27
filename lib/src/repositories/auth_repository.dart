import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

final kBaseUrl = DotEnv().env['API_HOST'];

class AuthRepository {
  static Future<http.Response> login(String username, String password) {
    final body = {
      "user": {
        "email": username,
        "password": password,
        "remember_me": "0",
      }
    };

    final jsonBody = json.encode(body);

    return http.post(
      '$kBaseUrl/users/login.json',
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
      },
      body: jsonBody,
    );
  }
}

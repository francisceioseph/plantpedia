import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plantpedia/src/utils/env.dart';

final kBaseUrl = Env.get('API_HOST');

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

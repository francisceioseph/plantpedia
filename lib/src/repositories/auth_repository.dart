import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:plantpedia/src/redux/store.dart';
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

  static Future<http.Response> logout() {
    String token = store.state.authState.token;

    return http.delete(
      '$kBaseUrl/users/logout.json',
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'authorization': token
      },
    );
  }

  static Future<http.Response> register(
    String name,
    String email,
    String password,
    String passwordConfirmation,
  ) {
    final body = {
      "user": {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": passwordConfirmation,
      }
    };

    final jsonBody = json.encode(body);

    return http.post(
      '$kBaseUrl/users/signup.json',
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
      },
      body: jsonBody,
    );
  }
}

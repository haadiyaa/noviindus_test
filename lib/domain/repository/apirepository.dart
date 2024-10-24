import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:noviindus_test/core/apikeys.dart';

class ApiRepository {
  Future<http.Response> login(
      {required String username, required String password}) async {
    final headers = {
      "Content-Type": "multipart/form-data",
    };
    final body = {
      "username": username,
      "password": password,
    };
    final response = await http.post(
      Uri.parse('${ApiKeys.baseUrl}${ApiKeys.login}'),
      body: jsonEncode(body),
      headers: headers,
    );
    return response;
  }

  Future<http.Response> getPatientList({required String token}) async {
    final headers = {
      "Authorization": "Bearer $token",
    };
    final response = await http.get(
      Uri.parse('${ApiKeys.baseUrl}${ApiKeys.login}'),
      headers: headers,
    );
    return response;
  }
}

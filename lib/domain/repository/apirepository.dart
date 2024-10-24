import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:noviindus_test/core/apikeys.dart';

class ApiRepository {
  Future<http.Response> login({
    required String username,
    required String password,
  }) async {
    var uri = Uri.parse('${ApiKeys.baseUrl}${ApiKeys.login}');
    var request = http.MultipartRequest('POST', uri);
    request.fields['username'] = username;
    request.fields['password'] = password;
    request.headers.addAll({
      "Content-Type": "multipart/form-data",
    });
    http.StreamedResponse response = await request.send();
    final httpResponse = await http.Response.fromStream(response);
    if (httpResponse.statusCode == 200) {
      print('Login Successful: ${httpResponse.body}');
    } else {
      print('Login Failed: ${httpResponse.statusCode}');
    }
    return httpResponse;
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

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:noviindus_test/core/apikeys.dart';
import 'package:noviindus_test/data/models/patientlistmodel.dart';

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

  Future<http.Response> registerPatient({
    required String token,
    required String name,
    required String excecutive,
    required String payment,
    required String phone,
    required String address,
    required String total_amount,
    required String discount_amount,
    required String advance_amount,
    required String balance_amount,
    required String date_nd_time,
    required String id,
    required String male,
    required String female,
    required String branch,
    required String treatments,
  }) async {
    var uri = Uri.parse('${ApiKeys.baseUrl}${ApiKeys.patientUpdate}');
    var request = http.MultipartRequest('POST', uri);
    print('adding fields');
    request.fields['name'] = name;
    request.fields['excecutive'] = excecutive;
    request.fields['payment'] = payment;
    request.fields['phone'] = phone;
    request.fields['address'] = address;
    request.fields['total_amount'] = total_amount;
    request.fields['discount_amount'] = discount_amount;
    request.fields['advance_amount'] = advance_amount;
    request.fields['balance_amount'] = balance_amount;
    request.fields['date_nd_time'] = date_nd_time;
    request.fields['id'] = id;
    request.fields['male'] = male;
    request.fields['female'] = female;
    request.fields['branch'] = branch;
    request.fields['treatments'] = treatments;
    print('adding headers');
    request.headers.addAll({
      "Content-Type": "multipart/form-data",
      "Authorization": "Bearer $token"
    });
    print('sending req');
    http.StreamedResponse response = await request.send();
    final httpResponse = await http.Response.fromStream(response);
    print('response ${httpResponse.body}');
    return httpResponse;
  }

  Future<http.Response> getTreatmentList({required String token}) async {
    final headers = {
      "Authorization": "Bearer $token",
    };
    final response = await http.get(
      Uri.parse('${ApiKeys.baseUrl}${ApiKeys.treatment}'),
      headers: headers,
    );
    return response;
  }

  Future<http.Response> getBranchList({required String token}) async {
    final headers = {
      "Authorization": "Bearer $token",
    };
    final response = await http.get(
      Uri.parse('${ApiKeys.baseUrl}${ApiKeys.brach}'),
      headers: headers,
    );
    return response;
  }

  Future<http.Response> getPatientList({required String token}) async {
    final headers = {
      "Authorization": "Bearer $token",
    };
    final response = await http.get(
      Uri.parse('${ApiKeys.baseUrl}${ApiKeys.patientList}'),
      headers: headers,
    );
    return response;
  }
}

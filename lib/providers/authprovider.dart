import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:noviindus_test/domain/repository/apirepository.dart';

enum Status { loading, initial, login, loginFailed }

class AuthProvider extends ChangeNotifier {
  String msg = '';
  final ApiRepository _apiRepository = ApiRepository();
  Future<void> loginUser(
      {required String username, required String password}) async {
    try {
      await _apiRepository.login(username: username, password: password).then(
        (response) {
          print(response.statusCode);
          final data=jsonDecode(response.body);
          if (response.statusCode == 200) {
            msg=data['message'];
            notifyListeners();
            print('Login Successful!');
          } else {
            msg=data['message'];
            notifyListeners();
            print('Login Failed!');
          }
        },
      );
    } catch (e) {
      msg = e.toString();
      notifyListeners();
      print('Login failes ${e.toString()}');
    }
  }
}

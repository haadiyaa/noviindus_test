import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:noviindus_test/core/constants.dart';
import 'package:noviindus_test/data/models/patientlistmodel.dart';
import 'package:noviindus_test/domain/repository/apirepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FunctionsProvider extends ChangeNotifier {
  final ApiRepository _apiRepository = ApiRepository();
  bool isPasswordvisible = false;
  PatientListModel? patientListModel;
  void togglePassword() {
    isPasswordvisible = !isPasswordvisible;
    notifyListeners();
  }

  Future<void> getPatientList() async {
    var sharedPref = await SharedPreferences.getInstance();
    String? token = sharedPref.getString(Constants.token);

    try {
      if (token != null) {
        final response = await _apiRepository.getPatientList(token: token).then(
          (response) {
            print('status code: ${response.statusCode}');
            final data = jsonDecode(response.body);
            print(data);
            if (response.statusCode == 200) {
              patientListModel = PatientListModel.fromJson(data);
              print(patientListModel!.patient[0].name);
            } else {
              print('status code ${response.statusCode}');
            }
          },
        );
      }
    } catch (e) {
      print('exception ${e.toString()}');
    }
  }
}

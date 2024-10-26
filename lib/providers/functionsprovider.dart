import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:noviindus_test/core/constants.dart';
import 'package:noviindus_test/data/models/branchmodel.dart';
import 'package:noviindus_test/data/models/patientlistmodel.dart';
import 'package:noviindus_test/data/models/treatmentslist.dart';
import 'package:noviindus_test/domain/repository/apirepository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FunctionsProvider extends ChangeNotifier {
  final ApiRepository _apiRepository = ApiRepository();
  bool isPasswordvisible = false;
  PatientListModel? patientListModel;
  TreatmentsModel? treatmentsModel;
  BranchModel? branchModel;
  String msg = '';
  void togglePassword() {
    isPasswordvisible = !isPasswordvisible;
    notifyListeners();
  }

  Future<void> getBranch() async {
    var sharedPref = await SharedPreferences.getInstance();
    String? token = sharedPref.getString(Constants.token);

    try {
      if (token != null) {
        final response = await _apiRepository.getBranchList(token: token).then(
          (response) {
            print('status code: ${response.statusCode}');
            final data = jsonDecode(response.body);
            print(data);
            if (response.statusCode == 200) {
              branchModel = BranchModel.fromJson(data);
              print(branchModel!.branches[0].name);
            } else {
              print('status code ${response.statusCode}');
            }
          },
        );
      }
    } catch (e) {
      print('exception ${e.toString()}');
    }
    notifyListeners();
  }

  Future<void> getTreatments() async {
    var sharedPref = await SharedPreferences.getInstance();
    String? token = sharedPref.getString(Constants.token);

    try {
      if (token != null) {
        final response =
            await _apiRepository.getTreatmentList(token: token).then(
          (response) {
            print('status code: ${response.statusCode}');
            final data = jsonDecode(response.body);
            print(data);
            if (response.statusCode == 200) {
              treatmentsModel = TreatmentsModel.fromJson(data);
              print(treatmentsModel!.treatments[0].name);
            } else {
              print('status code ${response.statusCode}');
            }
          },
        );
      }
    } catch (e) {
      print('exception ${e.toString()}');
    }
    notifyListeners();
  }

  Future<void> registerPatien({
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
    var sharedPref = await SharedPreferences.getInstance();
    String? token = sharedPref.getString(Constants.token);
    if (token != null) {
      try {
        final response = await _apiRepository
            .registerPatient(
          token: token,
          name: name,
          excecutive: excecutive,
          payment: payment,
          phone: phone,
          address: address,
          total_amount: total_amount,
          discount_amount: discount_amount,
          advance_amount: advance_amount,
          balance_amount: balance_amount,
          date_nd_time: date_nd_time,
          id: id,
          male: male,
          female: female,
          branch: branch,
          treatments: treatments,
        )
            .then(
          (response) {
            final data = jsonDecode(response.body);
            print(data);
            if (response.statusCode == 200) {
              print('success');
              msg = data['message'];
            } else {
              print('failures');
              msg = data['message'];
            }
          },
        );
      } catch (e) {
        print('exc ${e.toString()}');
        msg = e.toString();
      }
    }
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
            print('body ${data}');
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
    notifyListeners();
  }
}

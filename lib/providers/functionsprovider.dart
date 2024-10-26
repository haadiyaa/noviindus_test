import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:noviindus_test/core/constants.dart';
import 'package:noviindus_test/data/models/branchmodel.dart';
import 'package:noviindus_test/data/models/patientlistmodel.dart';
import 'package:noviindus_test/data/models/treatmentslist.dart';
import 'package:noviindus_test/domain/repository/apirepository.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
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

  Future<void> generateInvoicePdf({
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
    final pdf = pw.Document();
    print('loading pdf');
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text(
                        address,
                        style: pw.TextStyle(
                            fontSize: 18, fontWeight: pw.FontWeight.bold),
                      ),
                      pw.Text("Kumarakom"),
                      pw.Text('e-mail: unknown@gmail.com'),
                      pw.Text('Mob: +91 9876543210 | +91 9876543210'),
                      pw.Text('GST No: 32AABCU9603R1ZW'),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 20),

              pw.Text('Patient Details',
                  style: pw.TextStyle(
                      fontSize: 16, fontWeight: pw.FontWeight.bold)),
              pw.Divider(),
              pw.Row(
                children: [
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Name: $name'),
                      pw.Text('Address: $address'),
                      pw.Text('WhatsApp Number: $phone'),
                    ],
                  ),
                  pw.Spacer(),
                  pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text('Booked On: ${date_nd_time}'),
                      pw.Text('Treatment Date: 21/02/2024'),
                      pw.Text('Treatment Time: 11:00 am'),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 20),

              pw.Table.fromTextArray(
                headers: ['Treatment', 'Price', 'Male', 'Female', 'Total'],
                data: [
                  ['head massage', 'Rs. $advance_amount', '$male', '$female', 'Rs. $total_amount'],
                ],
              ),
              pw.SizedBox(height: 20),

              // Summary Section
              pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.end,
                children: [
                  pw.Text('Total Amount: Rs. $total_amount',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                  pw.Text('Discount: Rs. $discount_amount'),
                  pw.Text('Advance: Rs. $advance_amount'),
                  pw.Text('Balance: Rs. $balance_amount',
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ],
              ),
              pw.SizedBox(height: 30),

              pw.Text(
                'Thank you for choosing us',
                style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.green),
              ),
              pw.Text(
                  'Your well-being is our commitment, and we\'re honored you\'ve entrusted us with your health journey.'),
            ],
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/invoice.pdf");
    await file.writeAsBytes(await pdf.save());
    print('PDF Saved at ${file.path}');

    Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => file.readAsBytes());
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

import 'package:flutter/material.dart';

class FunctionsProvider extends ChangeNotifier {
  bool isPasswordvisible = false;
  void togglePassword() {
    isPasswordvisible = !isPasswordvisible;
    notifyListeners();
  }
}
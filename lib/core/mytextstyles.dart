import 'package:flutter/material.dart';
import 'package:noviindus_test/core/appcolors.dart';

class MyTextStyles {
  static const TextStyle headingStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 40, 40, 40),
  );
  static const TextStyle inputPlaceholderStyle = TextStyle(
    fontSize: 16,
    color: AppColors.grey,
  );
  static const TextStyle sort = TextStyle(
    fontSize: 16,
    color: AppColors.black,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle hintStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w300,
    color: Color.fromARGB(255, 99, 99, 99),
  );
  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
  static const TextStyle nameText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle subNameText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w300,
    color: AppColors.blue,
  );
  static const TextStyle dateText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.grey,
  );
}

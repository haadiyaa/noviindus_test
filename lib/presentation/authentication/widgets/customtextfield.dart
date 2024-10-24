
import 'package:flutter/material.dart';
import 'package:noviindus_test/core/appcolors.dart';
import 'package:noviindus_test/core/mytextstyles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
  });
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true, // For password input
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.lightgrey,
        hintText: hintText,
        hintStyle: MyTextStyles.hintStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.greytext),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.bordercolor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.bordercolor,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      ),
    );
  }
}

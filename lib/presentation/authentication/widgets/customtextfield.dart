import 'package:flutter/material.dart';
import 'package:noviindus_test/core/appcolors.dart';
import 'package:noviindus_test/core/mytextstyles.dart';
import 'package:noviindus_test/providers/functionsprovider.dart';
import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.validator,
    this.keyboardType,
    required this.obscureText,
  });
  final String hintText;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Consumer<FunctionsProvider>(
      builder: (context, functionsProvider, child) => TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText && !functionsProvider.isPasswordvisible,
        textInputAction: TextInputAction.next,
        validator: validator,
        decoration: InputDecoration(
          suffixIcon: obscureText
              ? IconButton(
                  onPressed: () {
                    functionsProvider.togglePassword();
                  },
                  icon: Icon(
                    functionsProvider.isPasswordvisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.white,
                  ),
                )
              : null,
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
      ),
    );
  }
}

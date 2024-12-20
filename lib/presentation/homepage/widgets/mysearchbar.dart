
import 'package:flutter/material.dart';
import 'package:noviindus_test/core/appcolors.dart';
import 'package:noviindus_test/core/mytextstyles.dart';

class MySearchbar extends StatelessWidget {
  const MySearchbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search for treatments',
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

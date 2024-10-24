import 'package:flutter/material.dart';
import 'package:noviindus_test/core/appcolors.dart';
import 'package:noviindus_test/core/mytextstyles.dart';

class FooterText extends StatelessWidget {
  const FooterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Text.rich(
        TextSpan(
          text:
              'By creating or logging into an account you are agreeing with our ',
          style: MyTextStyles.hintStyle
              .copyWith(fontSize: 12, color: AppColors.grey),
          children: [
            TextSpan(
              text: 'Terms and Conditions ',
              style: MyTextStyles.hintStyle.copyWith(
                  fontSize: 12,
                  color: AppColors.blue,
                  fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: 'and ',
              style: MyTextStyles.hintStyle.copyWith(
                fontSize: 12,
                color: AppColors.grey,
              ),
            ),
            TextSpan(
              text: 'Privacy Policy',
              style: MyTextStyles.hintStyle.copyWith(
                  fontSize: 12,
                  color: AppColors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

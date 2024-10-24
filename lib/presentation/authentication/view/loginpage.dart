import 'package:flutter/material.dart';
import 'package:noviindus_test/core/appcolors.dart';
import 'package:noviindus_test/core/constants.dart';
import 'package:noviindus_test/core/mytextstyles.dart';
import 'package:noviindus_test/presentation/authentication/widgets/customtextfield.dart';
import 'package:noviindus_test/presentation/authentication/widgets/footertext.dart';
import 'package:noviindus_test/presentation/authentication/widgets/loginheadimagewidget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              LoginHeadImageWidget(size: size),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Login Or Register To Book Your Appointments',
                      style: MyTextStyles.headingStyle,
                    ),
                    Constants.height20,
                    const Text(
                      'Email',
                      style: MyTextStyles.inputPlaceholderStyle,
                    ),
                    const SizedBox(height: 8),
                    const CustomTextField(hintText: 'Enter your Email'),
                    Constants.height20,
                    const Text(
                      'Password',
                      style: MyTextStyles.inputPlaceholderStyle,
                    ),
                    const SizedBox(height: 8),
                    const CustomTextField(
                      hintText: 'Enter password',
                    ),
                    Constants.height40,
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.green,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: MyTextStyles.buttonTextStyle,
                        ),
                      ),
                    ),
                    Constants.height40,
                    const FooterText(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

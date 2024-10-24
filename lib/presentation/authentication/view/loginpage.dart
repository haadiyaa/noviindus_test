import 'package:flutter/material.dart';
import 'package:noviindus_test/core/appcolors.dart';
import 'package:noviindus_test/core/constants.dart';
import 'package:noviindus_test/core/mytextstyles.dart';
import 'package:noviindus_test/presentation/authentication/widgets/customtextfield.dart';
import 'package:noviindus_test/presentation/authentication/widgets/footertext.dart';
import 'package:noviindus_test/presentation/authentication/widgets/loginheadimagewidget.dart';
import 'package:noviindus_test/presentation/homepage/view/homepage.dart';
import 'package:noviindus_test/providers/authprovider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final _key = GlobalKey<FormState>();

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
                child: Form(
                  key: _key,
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
                      CustomTextField(
                        obscureText: false,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Enter your email';
                          }
                          return null;
                        },
                        hintText: 'Enter your Email',
                        controller: nameController,
                      ),
                      Constants.height20,
                      const Text(
                        'Password',
                        style: MyTextStyles.inputPlaceholderStyle,
                      ),
                      const SizedBox(height: 8),
                      CustomTextField(
                        obscureText: true,
                        validator: (p0) {
                          if (p0 == null || p0.isEmpty) {
                            return 'Enter your email';
                          }
                          return null;
                        },
                        hintText: 'Enter password',
                        controller: passController,
                      ),
                      Constants.height40,
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              final authProvider = Provider.of<AuthProvider>(
                                  context,
                                  listen: false);
                              authProvider
                                  .loginUser(
                                username: nameController.text.trim(),
                                password: passController.text.trim(),
                              )
                                  .then(
                                (value) {
                                  if (authProvider.msg ==
                                      'Logged in successfully') {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(authProvider.msg)));
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => const HomePage()));
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text(authProvider.msg)));
                                  }
                                },
                              );
                            }
                          },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

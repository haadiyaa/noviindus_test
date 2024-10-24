import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:noviindus_test/core/constants.dart';
import 'package:noviindus_test/presentation/authentication/view/loginpage.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: FlutterSplashScreen.fadeIn(
        backgroundImage: const Image(
          image: AssetImage(Constants.bgimage),
          fit: BoxFit.cover,
        ),
        childWidget: Center(
          child: SizedBox(
            width: size.width * 0.6,
            child: const Image(
              image: AssetImage(Constants.logo),
            ),
          ),
        ),
        onAnimationEnd: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => LoginPage()));
        },
      ),
    );
  }
}

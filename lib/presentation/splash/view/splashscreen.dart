import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:noviindus_test/core/constants.dart';
import 'package:noviindus_test/presentation/authentication/view/loginpage.dart';
import 'package:noviindus_test/presentation/homepage/view/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        onAnimationEnd: () async {
          final sharedPref = await SharedPreferences.getInstance();
          String? token = sharedPref.getString(Constants.token);
          print('token $token');
          if (token != null) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => const HomePage()));
          } else {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => LoginPage()));
          }
        },
      ),
    );
  }
}

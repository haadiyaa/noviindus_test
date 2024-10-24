
import 'package:flutter/material.dart';
import 'package:noviindus_test/core/constants.dart';

class LoginHeadImageWidget extends StatelessWidget {
  const LoginHeadImageWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.3,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Constants.bg),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: SizedBox(
          width: size.width * 0.15,
          child: const Image(
            image: AssetImage(Constants.logo),
          ),
        ),
      ),
    );
  }
}

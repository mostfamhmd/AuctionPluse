import 'package:flutter/material.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/view/login_page.dart';

class Signin extends StatelessWidget {
  const Signin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Have an account?'),
        TextButton(
          onPressed: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false,
          ),
          child: const Text(
            'Sign in',
            style: TextStyle(color: AppColors.kLightBlue),
          ),
        ),
      ],
    );
  }
}

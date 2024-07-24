import 'package:flutter/material.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/feature/Sign%20Up%20Screen/presentation/view/sign_up.dart';

class Register extends StatelessWidget {
  const Register({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Don\'t have an account?'),
        TextButton(
          onPressed: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const SignUpScreen(),
            ),
            (route) => false,
          ),
          child: const Text(
            'Register',
            style: TextStyle(color: AppColors.kLightBlue),
          ),
        ),
      ],
    );
  }
}

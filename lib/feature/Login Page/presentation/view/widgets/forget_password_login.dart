import 'package:flutter/material.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/feature/Forget%20Password%20Page/presentation/view/forget_password_screen.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen(),
        ),
      ),
      child: const Text(
        'Forgot Password?',
        style: TextStyle(color: AppColors.kLightBlue),
      ),
    );
  }
}

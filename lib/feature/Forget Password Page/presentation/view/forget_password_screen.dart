import 'package:flutter/material.dart';
import 'package:smart_auction/feature/Forget%20Password%20Page/presentation/view/widgets/body_forget_password.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const BodyForgetPassword(),
    );
  }
}

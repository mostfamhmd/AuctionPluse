import 'package:flutter/material.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/view/widgets/body_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyLogin(),
    );
  }
}

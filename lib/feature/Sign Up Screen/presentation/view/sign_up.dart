import 'package:flutter/material.dart';

import 'package:smart_auction/feature/Sign%20Up%20Screen/presentation/view/widgets/body_sign_up.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: BodySignUp(),
      ),
    );
  }
}

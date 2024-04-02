import 'package:flutter/material.dart';
import 'package:smart_auction/feature/Authy%20Verification%20Screen/presentation/view/widgets/body_authy_verify.dart';

class AuthyVerificationScreen extends StatelessWidget {
  const AuthyVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const BodyAuthyVerify(),
    );
  }
}

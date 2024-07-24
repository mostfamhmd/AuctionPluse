import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Login%20Page/data/login_model.dart';
import 'package:smart_auction/feature/Password%20Page/presentation/view/widgets/body_password_page.dart';

class PasswordScreen extends StatelessWidget {
  const PasswordScreen({super.key, required this.userData});

  final LoginData userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(context, "Password"),
      body: BodyPasswordPage(userData: userData),
    );
  }
}

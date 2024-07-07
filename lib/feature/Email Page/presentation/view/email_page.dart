import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Email%20Page/presentation/view/widgets/body_email.dart';
import 'package:smart_auction/feature/Login%20Page/data/login_model.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key, required this.userData});

  final LoginData userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(context, "Email"),
      body: BodyEmail(
        userData: userData,
      ),
    );
  }
}

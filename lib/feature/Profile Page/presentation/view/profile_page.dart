import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Login%20Page/data/login_model.dart';
import 'widgets/body_profile_page.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.userData,
  });

  final LoginData userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(context, "Profile"),
      body: BodyProfilePage(userData: userData),
    );
  }
}

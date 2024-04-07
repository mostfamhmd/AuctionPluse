import 'package:flutter/material.dart';
import 'package:smart_auction/feature/Account%20Page/presentation/view/widgets/app_bar_account_page.dart';
import 'package:smart_auction/feature/Account%20Page/presentation/view/widgets/body_account.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarAccountPage(),
      body: const BodyAccount(),
    );
  }
}

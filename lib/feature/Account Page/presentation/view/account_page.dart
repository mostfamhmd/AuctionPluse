import 'package:flutter/material.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/Account%20Page/presentation/view/widgets/app_bar_account_page.dart';
import 'package:smart_auction/feature/Account%20Page/presentation/view/widgets/body_account.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String userRole = '';

  Future<String> getUserRole() async {
    userRole = await AppConsts.getData(AppConsts.kUserRole);
    setState(() {});

    return userRole;
  }

  @override
  void initState() {
    getUserRole();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarAccountPage(),
      body: BodyAccount(userRole: userRole),
    );
  }
}

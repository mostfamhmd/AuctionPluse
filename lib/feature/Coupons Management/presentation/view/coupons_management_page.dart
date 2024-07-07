import 'package:flutter/material.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Coupons%20Management/presentation/view/widgets/body_coupons_management.dart';

class CouponsManagementPage extends StatefulWidget {
  const CouponsManagementPage({super.key});

  @override
  State<CouponsManagementPage> createState() => _CouponsManagementPageState();
}

class _CouponsManagementPageState extends State<CouponsManagementPage> {
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
      appBar: backAppBar(context, "Manage all Coupons"),
      body: BodyCouponsManagement(userRole: userRole),
    );
  }
}

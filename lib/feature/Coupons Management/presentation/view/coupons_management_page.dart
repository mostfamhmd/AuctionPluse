import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Coupons%20Management/presentation/view/widgets/body_coupons_management.dart';

class CouponsManagementPage extends StatelessWidget {
  const CouponsManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(context, "Manage all Coupons"),
      body: const BodyCouponsManagement(),
    );
  }
}

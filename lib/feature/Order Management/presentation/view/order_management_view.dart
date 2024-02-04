import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/my_custom_app_bar.dart';
import 'package:smart_auction/core/widgets/Drawer/my_drawer.dart';
import 'package:smart_auction/feature/Order%20Management/presentation/view/widget/order_management_body.dart';

class OrderManagementView extends StatelessWidget {
  const OrderManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCustomAppBar(context, "Manage all orders"),
      body: const OrderManagementBody(),
    );
  }
}

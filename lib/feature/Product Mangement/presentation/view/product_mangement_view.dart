import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Product%20Mangement/presentation/view/widgets/product_management_body.dart';

import '../../../../core/widgets/AppBar/basic_app_bar.dart';
import '../../../../core/widgets/Drawer/my_drawer.dart';
import '../../../../core/widgets/My Bottom Nav Bar/bottom_nav_bar.dart';

class ProductManagementView extends StatelessWidget {
  const ProductManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basicAppBar(context, "Manage all products"),
      body: const ProductManagementBody(),
      endDrawer: const MyDrawer(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

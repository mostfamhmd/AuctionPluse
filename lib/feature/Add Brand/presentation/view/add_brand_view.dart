import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/basic_app_bar.dart';
import 'package:smart_auction/feature/Add%20Brand/presentation/view/widgets/add_brand_body.dart';

import '../../../../core/widgets/Drawer/my_drawer.dart';
import '../../../../core/widgets/My Bottom Nav Bar/bottom_nav_bar.dart';

class AddBrandView extends StatelessWidget {
  const AddBrandView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basicAppBar(context, "Add a new brand"),
      body: const AddBrandBody(),
      endDrawer: const MyDrawer(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

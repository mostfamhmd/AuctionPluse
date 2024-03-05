import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/basic_app_bar.dart';
import 'package:smart_auction/feature/Famous%20Brands/presentation/view/widgets/body_famous_brands_page.dart';

import '../../../../core/widgets/Drawer/my_drawer.dart';
import '../../../../core/widgets/My Bottom Nav Bar/bottom_nav_bar.dart';

class FamousBrandsPage extends StatelessWidget {
  const FamousBrandsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basicAppBar(context, "Famous Brand"),
      body: const BodyFamousBrandsPage(),
      endDrawer: const MyDrawer(),

    );
  }
}

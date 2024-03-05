import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/basic_app_bar.dart';
import 'package:smart_auction/feature/Best%20Seller/presentation/view/widgets/body_best_seller_page.dart';

import '../../../../core/widgets/Drawer/my_drawer.dart';
import '../../../../core/widgets/My Bottom Nav Bar/bottom_nav_bar.dart';

class BestSellerPage extends StatelessWidget {
  const BestSellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basicAppBar(context, "Best Seller"),
      body: const BodyBestSellerPage(),
      endDrawer: const MyDrawer(),

    );
  }
}

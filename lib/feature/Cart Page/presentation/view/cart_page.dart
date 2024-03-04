import 'package:flutter/material.dart';
import 'package:smart_auction/feature/Cart%20Page/presentation/view/widgets/body_cart_page.dart';

import '../../../../core/widgets/AppBar/back_widget_app_bar.dart';
import '../../../../core/widgets/My Bottom Nav Bar/bottom_nav_bar.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const BodyCartPage(),
      appBar: backWidgetAppBar(
        context,
        "Your Cart",
        null,
        null,
        null,
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

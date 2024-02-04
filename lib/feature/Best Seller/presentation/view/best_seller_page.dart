import 'package:flutter/material.dart';
import 'package:smart_auction/feature/Best%20Seller/presentation/view/widgets/app_bar_best_seller.dart';
import 'package:smart_auction/feature/Best%20Seller/presentation/view/widgets/body_best_seller_page.dart';


class BestSellerPage extends StatelessWidget {
  const BestSellerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: bestSellerAppBar(context, "Best Seller"),
      body: const BodyBestSellerPage(),
    );
  }
}

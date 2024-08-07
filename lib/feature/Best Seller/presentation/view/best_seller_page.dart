import 'package:flutter/material.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/widgets/AppBar/basic_app_bar.dart';
import 'package:smart_auction/feature/Best%20Seller/presentation/view/widgets/body_best_seller_page.dart';

import '../../../../core/widgets/Drawer/my_drawer.dart';

class BestSellerPage extends StatelessWidget {
  const BestSellerPage({super.key, required this.productInfoList});
  final List<ProductInfo> productInfoList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basicAppBar(context, "Best Seller"),
      body: BodyBestSellerPage(
        productInfoList: productInfoList,
      ),
      endDrawer: const MyDrawer(),
    );
  }
}

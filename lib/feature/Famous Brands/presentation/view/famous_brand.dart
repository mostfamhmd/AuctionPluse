import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/basic_app_bar.dart';
import 'package:smart_auction/feature/Famous%20Brands/data/model/get_brands_model.dart';
import 'package:smart_auction/feature/Famous%20Brands/presentation/view/widgets/body_famous_brands_page.dart';

import '../../../../core/widgets/Drawer/my_drawer.dart';

class FamousBrandsPage extends StatelessWidget {
  const FamousBrandsPage({super.key, required this.brands});
  final List<Brands> brands;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basicAppBar(context, "Famous Brand"),
      body: BodyFamousBrandsPage(
        brands: brands,
      ),
      endDrawer: const MyDrawer(),
    );
  }
}

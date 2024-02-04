import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/my_custom_app_bar.dart';
import 'package:smart_auction/feature/Product%20Mangement/presentation/view/widgets/product_management_body.dart';

class ProductManagementView extends StatelessWidget {
  const ProductManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCustomAppBar(context, "Manage all products"),
      body: const ProductManagementBody(),
    );
  }
}

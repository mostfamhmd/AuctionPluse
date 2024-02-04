import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/my_custom_app_bar.dart';
import 'package:smart_auction/core/widgets/Drawer/my_drawer.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/add_product_body.dart';

class AddProductsView extends StatelessWidget {
  const AddProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCustomAppBar(context, "Add a new product"),
      body: const AddProductBody(),
    );
  }
}

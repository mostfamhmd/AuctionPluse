import 'package:flutter/material.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/add_product_body.dart';

import '../../../../core/widgets/AppBar/basic_app_bar.dart';
import '../../../../core/widgets/Drawer/my_drawer.dart';

class AddProductsView extends StatelessWidget {
  const AddProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basicAppBar(context, "Add a new product"),
      body: const AddProductBody(),
      endDrawer: const MyDrawer(),
    );
  }
}

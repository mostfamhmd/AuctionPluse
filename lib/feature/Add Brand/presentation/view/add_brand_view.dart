import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/my_custom_app_bar.dart';
import 'package:smart_auction/core/widgets/Drawer/my_drawer.dart';
import 'package:smart_auction/feature/Add%20Brand/presentation/view/widgets/add_brand_body.dart';

class AddBrandView extends StatelessWidget {
  const AddBrandView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCustomAppBar(context, "Add a new brand"),
      endDrawer: const MyDrawer(),
      body: const AddBrandBody(),
    );
  }
}

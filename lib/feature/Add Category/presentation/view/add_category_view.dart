import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/my_custom_app_bar.dart';
import 'package:smart_auction/core/widgets/Drawer/my_drawer.dart';
import 'package:smart_auction/feature/Add%20Category/presentation/view/widgets/add_category_body.dart';

class AddCategoryView extends StatelessWidget {
  const AddCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myCustomAppBar(context, "Add a new category"),
      body: const AddCategoryBody(),
      endDrawer: const MyDrawer(),
    );
  }
}

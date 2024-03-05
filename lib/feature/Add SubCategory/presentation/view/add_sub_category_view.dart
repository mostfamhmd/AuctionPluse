import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/basic_app_bar.dart';
import 'package:smart_auction/feature/Add%20SubCategory/presentation/view/widgets/add_sub_category_body.dart';

import '../../../../core/widgets/Drawer/my_drawer.dart';
import '../../../../core/widgets/My Bottom Nav Bar/bottom_nav_bar.dart';

class AddSubCategoryView extends StatelessWidget {
  const AddSubCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basicAppBar(context, "Add a new subcategory"),
      body: const AddSubCategoryBody(),
      endDrawer: const MyDrawer(),

    );
  }
}

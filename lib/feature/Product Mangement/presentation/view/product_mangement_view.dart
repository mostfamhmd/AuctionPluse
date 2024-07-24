import 'package:flutter/material.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Product%20Mangement/presentation/view/widgets/product_management_body.dart';

class ProductManagementView extends StatefulWidget {
  const ProductManagementView({super.key});

  @override
  State<ProductManagementView> createState() => _ProductManagementViewState();
}

class _ProductManagementViewState extends State<ProductManagementView> {
  String userRole = '';

  Future<String> getUserRole() async {
    userRole = await AppConsts.getData(AppConsts.kUserRole);

    setState(() {});

    return userRole;
  }

  @override
  void initState() {
    getUserRole();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(context, "Manage all Products"),
      body: ProductManagementBody(userRole: userRole),
    );
  }
}

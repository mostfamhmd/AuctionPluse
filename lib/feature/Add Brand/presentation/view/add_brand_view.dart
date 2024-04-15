import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Add%20Brand/presentation/view/widgets/add_brand_body.dart';
import 'package:smart_auction/feature/Famous%20Brands/data/model/get_brands_model.dart';

class AddBrandView extends StatelessWidget {
  const AddBrandView({super.key, this.brand});
  final Brands? brand;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(
          context, brand != null ? "Update Brand" : "Add a new brand"),
      body: AddBrandBody(
        brand: brand,
      ),
    );
  }
}

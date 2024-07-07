import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/basic_app_bar.dart';
import 'package:smart_auction/feature/Update%20Product/presentation/view/widgets/body_update_product_view.dart';

class UpdateProductsView extends StatelessWidget {
  const UpdateProductsView({
    super.key,
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productPriceBeforeDiscount,
    required this.productPrice,
    required this.productQuantaty,
  });

  final String productId;

  final TextEditingController productName;
  final TextEditingController productDescription;
  final TextEditingController productPriceBeforeDiscount;
  final TextEditingController productPrice;
  final TextEditingController productQuantaty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: basicAppBar(context, "Update product"),
      body: UpdateProductBody(
        productId: productId,
        // ==================
        productName: productName,
        productDescription: productDescription,
        productPrice: productPrice,
        productPriceBeforeDiscount: productPriceBeforeDiscount,
        productQuantaty: productQuantaty,
      ),
    );
  }
}

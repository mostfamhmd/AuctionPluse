import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/Components/manage_order_or_product.dart';

import '../../utils/images.dart';

class ListOfOrdersOrProducts extends StatelessWidget {
  const ListOfOrdersOrProducts({super.key, required this.isEdit});
final bool isEdit;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ManageOrderOrProduct(
            urlLinkImage: AppImages.kIphone15,
            isEdit: isEdit,
            productPrice: r"$930.00",
            productName: "iphone 15 pro",
            productBrand: "apple",
            productDescription: "Lorem ipsum dolor sit amet consectetur. Et risus a aliquet id lectus lacus sapien etiam. Et risus a aliquet id lectus lacus sapien etiam",
            rating: 3.5,
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:smart_auction/feature/Order%20Management/presentation/view/widget/item_order.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return const ItemOrder();
        });
  }
}

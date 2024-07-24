import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/Components/body_view_product.dart';
import 'package:smart_auction/feature/Waiting%20Room/data/models/wanted_event_model.dart';

class ShowProduct extends StatelessWidget {
  const ShowProduct({
    super.key,
    required this.wantedRoom,
  });

  final WantedEventModel wantedRoom;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: BodyViewProduct(
        imageUrl: wantedRoom.productIds!.first.imageCover!,
        nameProduct: wantedRoom.productIds!.first.name!,
        overPrice: wantedRoom.productIds!.first.discountedPrice!.toString(),
        productPrice: wantedRoom.productIds!.first.price!.toString(),
        percentageOver: (wantedRoom.productIds!.first.discountedPrice! /
                wantedRoom.productIds!.first.price! *
                100)
            .toStringAsPrecision(2),
        rating: wantedRoom.productIds!.first.ratingsQuantity!.toDouble(),
      ),
    );
  }
}

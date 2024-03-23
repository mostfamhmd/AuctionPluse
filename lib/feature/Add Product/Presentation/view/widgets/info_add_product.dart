import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_auction/core/utils/images.dart';
import 'package:smart_auction/core/widgets/Components/my_custom_field.dart';

class InfoProduct extends StatefulWidget {
  const InfoProduct(
      {super.key,
      required this.productName,
      required this.productDescription,
      required this.productPriceBeforeDiscount,
      required this.productPrice});
  final TextEditingController productName;
  final TextEditingController productDescription;
  final TextEditingController productPriceBeforeDiscount;
  final TextEditingController productPrice;
  @override
  State<InfoProduct> createState() => _InfoProductState();
}

class _InfoProductState extends State<InfoProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            AppImages.kDefualt,
            height: 160.h,
            width: 160.w,
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        MyCustomField(
            myController: widget.productName,
            textAlign: TextAlign.left,
            hintText: "product name"),
        SizedBox(
          height: 10.h,
        ),
        MyCustomField(
            maxLines: null,
            myController: widget.productDescription,
            textAlign: TextAlign.left,
            hintText: "Product Description"),
        SizedBox(
          height: 10.h,
        ),
        MyCustomField(
            myController: widget.productPriceBeforeDiscount,
            textAlign: TextAlign.left,
            hintText: "Price before discount"),
        SizedBox(
          height: 10.h,
        ),
        MyCustomField(
            myController: widget.productPrice,
            textAlign: TextAlign.left,
            hintText: "Product price"),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}

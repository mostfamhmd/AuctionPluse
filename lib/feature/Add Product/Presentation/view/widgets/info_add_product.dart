// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/images.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/image_component.dart';
import 'package:smart_auction/core/widgets/Components/my_custom_field.dart';

class InfoProduct extends StatefulWidget {
  InfoProduct(
      {super.key,
      required this.productName,
      required this.productDescription,
      required this.productPriceBeforeDiscount,
      required this.productPrice,
      required this.productQuantaty,
      required this.listImage,
      this.coverImage,
      this.image,
      required this.iscoverImage,
      required this.coverImageFile});
  final TextEditingController productName;
  final TextEditingController productDescription;
  final TextEditingController productPriceBeforeDiscount;
  final TextEditingController productPrice;
  final TextEditingController productQuantaty;
  final ValueNotifier<List<dynamic>> listImage;
  late ValueNotifier<bool> iscoverImage = ValueNotifier<bool>(false);
  final dynamic coverImageFile;
  final void Function()? coverImage;
  final void Function()? image;

  @override
  State<InfoProduct> createState() => _InfoProductState();
}

class _InfoProductState extends State<InfoProduct> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "image cover",
          style: AppStyles.kPoppins400
              .copyWith(fontSize: 20.sp, color: AppColors.kGray),
        ),
        SizedBox(
          height: 10.h,
        ),
        InkWell(
          onTap: widget.coverImage,
          child: ValueListenableBuilder(
            valueListenable: widget.iscoverImage,
            builder: (BuildContext context, bool value, Widget? child) =>
                value == false
                    ? Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          AppImages.kDefualt,
                          height: 250.h,
                          width: 250.w,
                        ),
                      )
                    : widget.coverImageFile is File
                        ? Align(
                            alignment: Alignment.center,
                            child: Image.file(
                              widget.coverImageFile!,
                              fit: BoxFit.fill,
                              height: 250.h,
                              width: 250.w,
                            ),
                          )
                        : ImageComponent(
                            urlImage: widget.coverImageFile!,
                            height: 250.h,
                            width: 250.w,
                            radius: 0,
                          ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "Product Images",
          style: AppStyles.kPoppins400
              .copyWith(fontSize: 20.sp, color: AppColors.kGray),
        ),
        SizedBox(
          height: 10.h,
        ),
        ValueListenableBuilder(
          valueListenable: widget.listImage,
          builder: (BuildContext context, value, Widget? child) =>
              ListSliderProductImages(
            height: 250.h,
            width: 250.w,
            customizedBanners: List.generate(
              widget.listImage.value.length + 1,
              (index) => index <= widget.listImage.value.length - 1
                  ? value[index] is File
                      ? Image.file(
                          widget.listImage.value[index],
                          fit: BoxFit.fill,
                          height: 250.h,
                          width: 250.w,
                        )
                      : ImageComponent(
                          height: 250.h,
                          width: 250.w,
                          urlImage: value[index],
                          radius: 0,
                        )
                  : InkWell(
                      onTap: widget.image,
                      child: Align(
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          AppImages.kDefualt,
                          height: 250.h,
                          width: 250.w,
                        ),
                      ),
                    ),
            ),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        MyCustomField(
          myController: widget.productName,
          textAlign: TextAlign.left,
          hintText: "Name",
          keyboardType: TextInputType.name,
        ),
        SizedBox(
          height: 10.h,
        ),
        MyCustomField(
          maxLines: null,
          myController: widget.productDescription,
          textAlign: TextAlign.left,
          hintText: "Description",
          keyboardType: TextInputType.name,
        ),
        SizedBox(
          height: 10.h,
        ),
        MyCustomField(
          myController: widget.productQuantaty,
          textAlign: TextAlign.left,
          hintText: "Quantaty",
          keyboardType: TextInputType.number,
        ),
        SizedBox(
          height: 10.h,
        ),
        MyCustomField(
          myController: widget.productPriceBeforeDiscount,
          textAlign: TextAlign.left,
          hintText: "Discount",
          keyboardType: TextInputType.number,
        ),
        SizedBox(
          height: 10.h,
        ),
        MyCustomField(
          myController: widget.productPrice,
          textAlign: TextAlign.left,
          hintText: "Price",
          keyboardType: TextInputType.number,
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}

class ListSliderProductImages extends StatelessWidget {
  const ListSliderProductImages(
      {super.key, this.customizedBanners, this.height, this.width});
  final List<Widget>? customizedBanners;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return BannerCarousel(
      height: height ?? 200.h,
      width: width ?? double.maxFinite,
      disableColor: AppColors.kGray,
      activeColor: AppColors.kBlue,
      animation: true,
      customizedBanners: customizedBanners,
    );
  }
}

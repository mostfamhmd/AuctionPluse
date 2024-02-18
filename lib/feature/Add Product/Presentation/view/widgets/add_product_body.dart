import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/images.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/my_custom_button.dart';
import 'package:smart_auction/core/widgets/Components/my_custom_field.dart';
import 'package:smart_auction/core/widgets/Components/my_custom_suffix_field.dart';

class AddProductBody extends StatelessWidget {
  const AddProductBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController productName = TextEditingController();
    TextEditingController productDescription = TextEditingController();
    TextEditingController productPriceBeforeDiscount = TextEditingController();
    TextEditingController productPrice = TextEditingController();
    TextEditingController productMainClassification = TextEditingController();
    TextEditingController productSubclassification = TextEditingController();
    TextEditingController productBrand = TextEditingController();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 5.h),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                myController: productName,
                textAlign: TextAlign.left,
                hintText: "product name"),
            SizedBox(
              height: 10.h,
            ),
            MyCustomField(
                maxLines: null,
                myController: productDescription,
                textAlign: TextAlign.left,
                hintText: "Product Description"),
            SizedBox(
              height: 10.h,
            ),
            MyCustomField(
                myController: productPriceBeforeDiscount,
                textAlign: TextAlign.left,
                hintText: "Price before discount"),
            SizedBox(
              height: 10.h,
            ),
            MyCustomField(
                myController: productPrice,
                textAlign: TextAlign.left,
                hintText: "Product price"),
            SizedBox(
              height: 10.h,
            ),
            MyCustomSuffixField(
                myController: productMainClassification,
                textAlign: TextAlign.left,
                hintText: "Main classification"),
            SizedBox(
              height: 10.h,
            ),
            MyCustomField(
                myController: productSubclassification,
                textAlign: TextAlign.left,
                hintText: "Subclassification"),
            SizedBox(
              height: 10.h,
            ),
            MyCustomSuffixField(
                myController: productBrand,
                textAlign: TextAlign.left,
                hintText: "The brand"),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Available colors of the product",
              style: AppStyles.kPoppins500
                  .copyWith(fontSize: 16.sp, color: AppColors.kGray),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.kDarkBlue),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.kRed),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.kBlue),
                ),
                SizedBox(
                  width: 20.w,
                ),
                SvgPicture.asset(AppIcons.kAddColor),
                SizedBox(
                  width: 20.w,
                ),
              ],
            ),
            const Align(
              alignment: Alignment.topRight,
              child: MyCustomButton(nameButton: "Add Product"),
            ),
          ]),
        ),
      ),
    );
  }
}

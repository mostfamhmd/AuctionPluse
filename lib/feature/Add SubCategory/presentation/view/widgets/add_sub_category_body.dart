import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/widgets/Components/my_custom_button.dart';
import 'package:smart_auction/core/widgets/Components/my_custom_field.dart';
import 'package:smart_auction/core/widgets/Components/my_custom_suffix_field.dart';

class AddSubCategoryBody extends StatelessWidget {
  const AddSubCategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameSubCategory = TextEditingController();
    TextEditingController firstCategoryController = TextEditingController();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.h,
            ),
            MyCustomField(
              myController: nameSubCategory,
              textAlign: TextAlign.left,
              hintText: "Subcategory name",
            ),
            SizedBox(
              height: 30.h,
            ),
            MyCustomSuffixField(
              hintText: "First category",
              myController: firstCategoryController,
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 30.h,
            ),
            const MyCustomButton(
              nameButton: "Add Subcategory",
            ),
          ],
        ),
      ),
    );
  }
}

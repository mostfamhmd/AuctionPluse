import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/images.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/my_small_btn.dart';
import 'package:smart_auction/core/widgets/Components/my_custom_field.dart';

class AddCategoryBody extends StatelessWidget {
  const AddCategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameCategory = TextEditingController();
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Text(
              "Category image",
              style: AppStyles.kPoppins400
                  .copyWith(fontSize: 20.sp, color: AppColors.kGray),
            ),
            SizedBox(
              height: 40.h,
            ),
            SvgPicture.asset(
              AppImages.kDefualt,
            ),
            SizedBox(
              height: 40.h,
            ),
            MyCustomField(
              myController: nameCategory,
              textAlign: TextAlign.center,
              hintText: "Category name",
            ),
            SizedBox(
              height: 30.h,
            ),
            const MySmallBTN(
              nameButton: "Add Category",
            ),
          ],
        ),
      ),
    );
  }
}

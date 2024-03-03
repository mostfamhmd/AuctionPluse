import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/widgets/Components/my_small_btn.dart';
import 'package:smart_auction/feature/Write%20Comments/presentation/view/widgets/rating_comment.dart';

import '../../../../../core/widgets/Components/my_custom_field.dart';

class BodyWriteCommentsPage extends StatefulWidget {
  const BodyWriteCommentsPage({super.key});

  @override
  State<BodyWriteCommentsPage> createState() => _BodyWriteCommentsPageState();
}

class _BodyWriteCommentsPageState extends State<BodyWriteCommentsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Please write Overall level of satisfaction with your shipping / Delivery Service",
              style: TextStyle(
                color: AppColors.kDarkBlue,
                fontFamily: AppFonts.kPoppins700,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            const RatingComment(),
            SizedBox(
              height: 15.h,
            ),
            Text(
              "Write Your Review",
              style: TextStyle(
                color: AppColors.kDarkBlue,
                fontFamily: AppFonts.kPoppins700,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            MyCustomField(
              hintText: "Write your review here",
              myController: TextEditingController(),
              textAlign: TextAlign.start,
              maxLines: null,
            ),
            SizedBox(
              height: 15.h,
            ),
            const Center(
              child: MySmallBTN(
                nameButton: "Add a comment",
              ),
            )
          ],
        ),
      ),
    );
  }
}

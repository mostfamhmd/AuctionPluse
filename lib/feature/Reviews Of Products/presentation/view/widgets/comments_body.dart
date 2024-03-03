import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/fonts.dart';
import '../../../../../core/utils/images.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/Components/rating_widget.dart';

class BodyComments extends StatelessWidget {
  const BodyComments({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.h,
            ),
            IntrinsicWidth(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage:
                    const AssetImage(AppImages.kEslamNasr),
                    radius: 40.r,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    children: [
                      Text(
                        "Eslam Nasr",
                        style: AppStyles.kPoppins700.copyWith(
                          fontSize: 14.sp,
                          fontFamily: AppFonts.kPoppins700,
                        ),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      RatingWidget(rating: 4),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "A suitable product, its price at the present time is very good, and it has additional reasons",
              style: TextStyle(
                fontFamily: AppFonts.kPoppins400,
                color: AppColors.kGray,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              "December 10, 2016",
              style: TextStyle(
                fontFamily: AppFonts.kPoppins400,
                color: AppColors.kGray,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }
}

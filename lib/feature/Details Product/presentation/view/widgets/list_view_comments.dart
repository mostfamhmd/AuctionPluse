import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/fonts.dart';
import '../../../../../core/utils/images.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../../core/widgets/Components/rating_widget.dart';

class ListViewComments extends StatelessWidget {
  const ListViewComments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicWidth(
            child: Row(
              children: [
                RatingWidget(rating: 4.5),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  "4.5",
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontFamily: AppFonts.kPoppins700,
                    color: AppColors.kGray,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "(5 Review)",
                  style: TextStyle(
                    fontFamily: AppFonts.kPoppins400,
                    fontSize: 12.sp,
                    color: AppColors.kGray,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          IntrinsicWidth(
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage(AppImages.kEslamNasr),
                ),
                SizedBox(
                  width: 10.w,
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
                      height: 5.h,
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
    );
  }
}

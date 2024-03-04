import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/view_shows_btn.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/fonts.dart';
import '../../../../../core/utils/icons.dart';
import '../../../../../core/widgets/Components/custom_more.dart';

class LiveAuction extends StatelessWidget {
  const LiveAuction({super.key, this.seeAll, this.viewShows});

  final void Function()? seeAll;
  final void Function()? viewShows;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            SvgPicture.asset(AppIcons.kLiveAuction),
            SizedBox(
              width: 10.w,
            ),
            Flexible(
              child: CustomMore(
                type: "Live auction area",
                typeMore: "See All",
                onTap: seeAll,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Divider(
          thickness: 2.w,
          indent: 0.w,
          endIndent: 0.w,
          color: AppColors.kGray.withOpacity(0.5),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "There are no live shows at the moment",
          style: TextStyle(
            color: AppColors.kGray,
            fontFamily: AppFonts.kPoppins500,
            fontSize: 12.sp,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          "Start live streaming now",
          style: TextStyle(
            color: Colors.red,
            fontFamily: AppFonts.kPoppins700,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: InkWell(
            onTap: viewShows,
            child: const ViewShowsBTN(),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Divider(
          thickness: 2.w,
          indent: 0.w,
          endIndent: 0.w,
          color: AppColors.kGray.withOpacity(0.5),
        ),
      ],
    );
  }
}

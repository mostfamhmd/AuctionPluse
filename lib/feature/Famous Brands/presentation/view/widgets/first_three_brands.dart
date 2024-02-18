import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Famous%20Brands/presentation/view/widgets/position_card_number.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/styles.dart';

class FirstThreeBrands extends StatelessWidget {
  const FirstThreeBrands(
      {super.key,
      required this.imagePath,
      required this.brandName,
      required this.brandDescription,
      required this.rankColor,
      required this.rankNum,
      required this.topCard});

  final String imagePath;
  final String brandName;
  final String brandDescription;
  final int rankColor;
  final int rankNum;
  final double topCard;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150.h,
          width: 385.w,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: AppColors.kGray.withOpacity(0.2),
                blurStyle: BlurStyle.normal,
                blurRadius: 10.r,
                offset: const Offset(9, 9),
              ),
              BoxShadow(
                blurRadius: 10.r,
                color: AppColors.kGray.withOpacity(0.2),
                blurStyle: BlurStyle.normal,
                offset: const Offset(-9, -9),
              ),
            ],
          ),
          child: Row(children: [
            Image.asset(imagePath),
            SizedBox(
              width: 30.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    brandName,
                    style: AppStyles.kPoppins700
                        .copyWith(fontSize: 18.sp, color: AppColors.kBlack),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    brandDescription,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        AppStyles.kPoppins400.copyWith(color: AppColors.kBlack),
                  ),
                ],
              ),
            )
          ]),
        ),
        PositionCardRank(color: rankColor, rankNum: rankNum, top: topCard),
      ],
    );
  }
}
List<BoxShadow> middleBoxShadow = [
  BoxShadow(
    color: AppColors.kGray.withOpacity(0.9),
    blurStyle: BlurStyle.normal,
    offset: const Offset(2, 4),
  ),
  BoxShadow(
    color: AppColors.kGray.withOpacity(0.9),
    blurStyle: BlurStyle.normal,
    offset: const Offset(-2, -4),
  ),
];
List<BoxShadow> firstBoxShadow = [
  BoxShadow(
    color: AppColors.kGray.withOpacity(0.3),
    blurRadius: 4,
    blurStyle: BlurStyle.normal,
    offset: const Offset(8, 0),
  ),
];
List<BoxShadow> latestBoxShadow = [
  BoxShadow(
    color: AppColors.kGray.withOpacity(0.3),
    blurRadius: 4,
    blurStyle: BlurStyle.normal,
    offset: const Offset(-8, 0),
  ),
];
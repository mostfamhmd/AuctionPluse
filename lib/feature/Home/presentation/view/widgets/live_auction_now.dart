import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/image_component.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/room.dart';

class LiveAuctionNow extends StatelessWidget {
  const LiveAuctionNow({
    super.key,
    required this.scheduleLive,
  });

  final List<Room> scheduleLive;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 10.w,
        children: List.generate(
          scheduleLive.length <= 3 ? scheduleLive.length : 3,
          (index) => SizedBox(
            height: 120.h,
            width: 100.w,
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  ImageComponent(
                      urlImage:
                          scheduleLive[index].productIds!.first.imageCover!,
                      height: 70.h,
                      width: 65.w,
                      radius: 20.w),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    scheduleLive[index].title!,
                    style: AppStyles.kPoppins500.copyWith(
                      color: AppColors.kBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

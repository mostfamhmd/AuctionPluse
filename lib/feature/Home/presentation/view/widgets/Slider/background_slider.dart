import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/images.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/Slider/sale_slider.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/Slider/timer_slider.dart';

class BackgroundSlider extends StatelessWidget {
  const BackgroundSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: 400.w,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage(AppImages.kPromotionSlider),
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 35.h, left: 25.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SaleSlider(),
            SizedBox(
              height: 30.h,
            ),
            const TimerSlider(),
          ],
        ),
      ),
    );
  }
}

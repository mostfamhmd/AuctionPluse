import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/images.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: BannerCarousel.fullScreen(
        height: 230.h,
        animation: false,
        activeColor: AppColors.kLightBlue,
        customizedBanners: [
          Image.asset(
            AppImages.kIphone15,
          ),
          Image.asset(
            AppImages.kIphone15,
          ),
          Image.asset(
            AppImages.kIphone15,
          ),
          Image.asset(
            AppImages.kIphone15,
          ),
          Image.asset(
            AppImages.kIphone15,
          ),
        ],
      ),
    );
  }
}

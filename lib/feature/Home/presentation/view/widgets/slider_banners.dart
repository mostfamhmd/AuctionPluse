import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/images.dart';
import '../../../../../core/widgets/Components/background_slider.dart';
import '../../../../../core/widgets/Components/container_ads.dart';

class SliderBanners extends StatelessWidget {
  const SliderBanners({super.key});

  @override
  Widget build(BuildContext context) {
    return BannerCarousel.fullScreen(
      height: 230.h,
      disableColor: AppColors.kGray,
      activeColor: AppColors.kBlue,
      animation: false,
      customizedBanners: [
        const BackgroundSlider(),
        ContainerAds(
          pathImageAds: AppImages.kAdvs1,
          onTap: () {},
        ),
        ContainerAds(
          pathImageAds: AppImages.kAdvs2,
          onTap: () {},
        ),
        ContainerAds(
          pathImageAds: AppImages.kAdvs3,
          onTap: () {},
        ),
      ],
    );
  }
}

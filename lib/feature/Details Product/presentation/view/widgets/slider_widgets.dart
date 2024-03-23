import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/widgets/Components/image_component.dart';

import '../../../../../core/utils/colors.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key, required this.images});
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: BannerCarousel.fullScreen(
        height: 230.h,
        animation: false,
        activeColor: AppColors.kLightBlue,
        customizedBanners: List.generate(
          images.length,
          (index) => ImageComponent(
              urlImage: images[index],
              height: 100.h,
              width: MediaQuery.sizeOf(context).width,
              radius: 0),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/details_product.dart';

import '../../../../../core/utils/images.dart';
import '../../../../../core/widgets/Components/background_slider.dart';
import '../../../../../core/widgets/Components/container_ads.dart';

class BodySuperFlashSalePage extends StatelessWidget {
  const BodySuperFlashSalePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailsProductPage(),
                  ),
                );
              },
              child: const BackgroundSlider(),
            ),
            SizedBox(
              height: 20.h,
            ),
            ContainerAds(
              pathImageAds: AppImages.kAdvs1,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailsProductPage(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            ContainerAds(
              pathImageAds: AppImages.kAdvs2,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailsProductPage(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            ContainerAds(
              pathImageAds: AppImages.kAdvs3,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailsProductPage(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}

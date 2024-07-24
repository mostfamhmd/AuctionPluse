import 'package:flutter/material.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/images.dart';
import 'package:smart_auction/feature/onBoarding/presentation/view/widgets/three_on_boarding.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BodyOnBoarding extends StatefulWidget {
  const BodyOnBoarding({
    super.key,
  });

  @override
  State<BodyOnBoarding> createState() => _BodyOnBoardingState();
}

class _BodyOnBoardingState extends State<BodyOnBoarding> {
  final List<String> images = [
    AppImages.kOnBoarding1,
    AppImages.kOnBoarding2,
    AppImages.kOnBoarding3,
  ];

  final List<String> titles = [
    'Lorem ipsum dolor sit amet consectetur',
    'Lorem ipsum dolor sit amet consectetur',
  ];

  final List<String> descriptions = [
    'Lorem ipsum dolor sit amet consectetur. Feugiat sagittis nam augue turpis vel',
    'Lorem ipsum dolor sit amet consectetur. Feugiat sagittis nam augue turpis vel',
  ];

  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: images.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => ThreeOnBoarding(
                image: images[index],
                title: titles[index == 2 ? index - 1 : index],
                description: descriptions[index == 2 ? index - 1 : index],
                index: index,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SmoothPageIndicator(
              controller: pageController,
              count: images.length,
              effect: const WormEffect(
                activeDotColor: AppColors.kBlue,
                dotColor: AppColors.kGray,
                radius: 5,
                spacing: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

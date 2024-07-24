import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/Slider/do_indicator.dart';

class Dots extends StatelessWidget {
  const Dots(
      {super.key,
      required this.pageController,
      required this.pageIndex,
      required this.numberDots});
  final PageController pageController;
  final int pageIndex;
  final int numberDots;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          numberDots,
          (index) => Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: InkWell(
                onTap: () {
                  pageController.jumpToPage(index);
                },
                child: DoIndicator(isActive: index == pageIndex)),
          ),
        ),
      ],
    );
  }
}

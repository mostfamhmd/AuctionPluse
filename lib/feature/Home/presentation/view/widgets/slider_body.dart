// ignore_for_file: unused_field

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/Slider/background_slider.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/Slider/dots.dart';

class SliderBody extends StatefulWidget {
  const SliderBody({super.key, required this.numberAds});
  final int numberAds;
  @override
  State<SliderBody> createState() => _SliderBodyState();
}

class _SliderBodyState extends State<SliderBody> {
  late PageController _pageController;

  int _pageIndex = 0;

  Timer? _timer;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageIndex < widget.numberAds - 1) {
        _pageIndex++;
      } else {
        _pageIndex = 0;
      }
      _pageController.animateToPage(
        _pageIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200.h,
          child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: widget.numberAds,
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [BackgroundSlider()],
              );
            },
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Dots(
          numberDots: widget.numberAds,
          pageController: _pageController,
          pageIndex: _pageIndex,
        ),
      ],
    );
  }
}

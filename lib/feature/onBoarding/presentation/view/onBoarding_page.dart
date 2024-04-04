// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'package:smart_auction/feature/onBoarding/presentation/view/widgets/body_on_boarding.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: BodyOnBoarding(),
    );
  }
}

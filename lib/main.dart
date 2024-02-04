import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/feature/Home/presentation/view/home_view.dart';

void main() {
  runApp(const SmartAuction());
}

class SmartAuction extends StatelessWidget {
  const SmartAuction({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.kWhite.withOpacity(0.90),
        ),
        home: const HomeView(),
      ),
    );
  }
}


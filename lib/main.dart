import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/globals/glopals.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/Home/presentation/view/home_view.dart';
import 'package:smart_auction/feature/onBoarding/presentation/view/onBoarding_page.dart';

import 'core/main_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  role = await AppConsts.getData(AppConsts.kUserRole);
  userId = await AppConsts.getData(AppConsts.kUserId);
  if (kDebugMode) {
    print(userId);
    print(role);
  }
  runApp(const SmartAuction());
}

class SmartAuction extends StatelessWidget {
  const SmartAuction({super.key});

  @override
  Widget build(BuildContext context) {
    return MainCubit(
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        splitScreenMode: true,
        child: MaterialApp(
          title: "Smart Auction Plus",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.kWhite,
          ),
          home: userId == null ? const OnBoardingScreen() : HomeView(),
        ),
      ),
    );
  }
}

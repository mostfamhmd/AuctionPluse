import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/globals/glopals.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/feature/Home/presentation/view/home_view.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/view/login_page.dart';
import 'package:smart_auction/feature/onBoarding/presentation/view/onBoarding_page.dart';
import 'package:smart_auction/firebase_options.dart';

import 'core/main_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  role = await AppConsts.getData(AppConsts.kUserRole);
  userId = await AppConsts.getData(AppConsts.kUserId);
  inBording = await AppConsts.getData(AppConsts.kUserOnBording);
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
          home: inBording == "true"
              ? userId == null
                  ? const LoginScreen()
                  : HomeView()
              : const OnBoardingScreen(),
        ),
      ),
    );
  }
}

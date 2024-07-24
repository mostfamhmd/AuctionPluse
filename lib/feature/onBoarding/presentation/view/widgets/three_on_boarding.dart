import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/utils/images.dart';
import 'package:smart_auction/core/widgets/Components/elevated_button.dart';
import 'package:smart_auction/core/widgets/Components/outlined_button.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/view/login_page.dart';
import 'package:smart_auction/feature/Sign%20Up%20Screen/presentation/view/sign_up.dart';

class ThreeOnBoarding extends StatelessWidget {
  const ThreeOnBoarding({
    super.key,
    this.image,
    this.title,
    this.description,
    required this.index,
  });

  final String? image;
  final String? title;
  final String? description;
  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          index != 2
              ? Image.asset(image!)
              : Stack(
                  alignment: Alignment.center,
                  children: [
                    // background image
                    Image.asset(image!),

                    Column(
                      children: [
                        // logo
                        Image.asset(AppImages.kAppLogo),

                        // title
                        Text(
                          'AuctionPlus',
                          style: TextStyle(
                            fontFamily: AppFonts.kInter700,
                            fontSize: 30.sp,
                          ),
                        ),

                        // login
                        customElevatedButton(
                          context,
                          onPressed: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                            (route) => false,
                          ),
                          title: 'Login',
                        ),

                        SizedBox(height: size.height * 0.02),

                        // sign up
                        customOutlinedButton(
                          context,
                          onPressed: () => Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                            (route) => false,
                          ),
                          title: 'Sign Up',
                        ),
                      ],
                    ),
                  ],
                ),

          if (index != 2) SizedBox(height: size.height * 0.06),

          // titles
          if (index != 2)
            Text(
              title!,
              style: TextStyle(
                fontSize: 32.sp,
                fontFamily: AppFonts.kInter700,
                color: AppColors.kBlack,
              ),
            ),

          if (index != 2) SizedBox(height: size.height * 0.06),

          // descriptions
          if (index != 2)
            Text(
              description!,
              style: TextStyle(
                fontSize: 20.sp,
                fontFamily: AppFonts.kInter400,
                color: AppColors.kGray,
              ),
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/widgets/Components/my_big_btn.dart';
import 'package:smart_auction/feature/Home/presentation/view/home_view.dart';

class BodyPaymentSuccessPage extends StatelessWidget {
  const BodyPaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppIcons.kSuccessPayment,
          ),
          SizedBox(height: 20.h,),
          Text('Success',
          style: TextStyle(
            color: AppColors.kDarkBlue,
            fontFamily: AppFonts.kPoppins700,
            fontSize: 24.sp,
          ),),
          SizedBox(height: 20.h,),
          Text('thank you for shopping using lafyuu',
            style: TextStyle(
              color: AppColors.kGray,
              fontFamily: AppFonts.kPoppins400,
              fontSize: 12.sp,
            ),),
          SizedBox(height: 20.h,),
          MyBigBTN(
            nameBTN: "Back To Order",
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeView(
                      currentIndex: 0,
                    ),
                  ),
                  (route) => false);
            },
          )
        ],
      ),
    );
  }
}

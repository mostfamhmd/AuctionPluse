import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/widgets/Components/elevated_button.dart';

class BodySuccess extends StatelessWidget {
  const BodySuccess({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    color: Colors.green,
                    size: 56.sp,
                  ),
                  SizedBox(height: 20.h),
                  const Text(
                    'Successful!',
                    style: TextStyle(
                      fontFamily: AppFonts.kInter700,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      'You have successfully registered in our app and start working in it.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppFonts.kInter500,
                        fontSize: 15,
                        color: AppColors.kGray,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Start Shopping
          Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              width: double.infinity,
              child: customElevatedButton(
                context,
                title: 'Start shopping',
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}

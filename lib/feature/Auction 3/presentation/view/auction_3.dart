import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/widgets/Components/custom_text_form_field.dart';
import 'package:smart_auction/core/widgets/Components/elevated_button.dart';
import 'package:smart_auction/feature/Auction%201/presentation/view/auction_1.dart';

class Auction3 extends StatelessWidget {
  const Auction3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              children: [
                _userNameWithLeave(context),

                // user data
                _userData(context),

                // followers count
                _followersCount(),

                const Spacer(),

                _waitingMessage(),

                const Spacer(),

                // add comment
                customTextFormField(
                  keyboardType: TextInputType.multiline,
                  lableText: 'Add a comment',
                  suffixIcon: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Share',
                      style: TextStyle(
                        color: AppColors.kBlue,
                        fontFamily: AppFonts.kPoppins700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Expanded _waitingMessage() {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Wait for the host to start th show
          const Text(
            'Wait for the host to start th show',
            style: TextStyle(
              fontFamily: AppFonts.kInter500,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),

          SizedBox(height: 15.h),

          const Text(
            'Tomorrow, 12:00 Am',
            style: TextStyle(
              color: AppColors.kBlue,
              fontFamily: AppFonts.kInter500,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Row _followersCount() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          '69k',
          style: TextStyle(
            fontFamily: AppFonts.kInter600,
            fontSize: 18,
          ),
        ),
        SizedBox(width: 10.w),
        const Text(
          'Followers',
          style: TextStyle(
            fontFamily: AppFonts.kPoppins500,
          ),
        )
      ],
    );
  }

  Row _userData(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // user avatar
        const CircleAvatar(
          radius: 30,
        ),

        SizedBox(width: 30.w),

        // rate value
        RatingStars(
          value: 3.5,
          onValueChanged: (v) {},
          starBuilder: (index, starColor) => SvgPicture.asset(
            AppIcons.kStar,
            colorFilter: ColorFilter.mode(
              starColor!,
              BlendMode.srcIn,
            ),
          ),
          starCount: 5,
          maxValue: 5.0,
          valueLabelVisibility: false,
          starOffColor: Colors.grey,
          starColor: const Color(0xFFFFC833),
        ),

        SizedBox(width: 30.w),

        // follow button
        SizedBox(
          width: 110.w,
          child: customElevatedButton(
            context,
            title: 'Follow',
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Row _userNameWithLeave(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // user name
        const Text(
          'Eslam Nasr',
          style: TextStyle(
            fontFamily: AppFonts.kInter500,
            fontSize: 16,
          ),
        ),

        SizedBox(width: 70.w),

        // leave
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.remove_red_eye),
            const Text('10'),
            TextButton(
              onPressed: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const Auction1(),
                ),
                (route) => false,
              ),
              child: const Text(
                'Leave',
                style: TextStyle(
                  fontFamily: AppFonts.kInter600,
                  color: AppColors.kRed,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

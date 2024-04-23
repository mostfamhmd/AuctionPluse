import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/widgets/Components/custom_title.dart';
import 'package:smart_auction/core/widgets/Components/elevated_button.dart';
import 'package:smart_auction/feature/Auction%202/presentation/view/auction_2.dart';
import 'package:smart_auction/feature/Auction%203/presentation/view/auction_3.dart';

class Auction1 extends StatelessWidget {
  const Auction1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: 16,
        ),
        title: const CustomTitle(title: 'Upcoming live shows'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Auction2(),
              ),
            ),
            icon: SvgPicture.asset(AppIcons.kSchedule),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.kGray.withOpacity(.4),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // بيانات المستخدم اللي عامل المزاد
              const UserDataWhoMakeHost(),

              SizedBox(height: 20.h),

              const Text(
                'LOREM TEXT',
                style: TextStyle(
                  fontFamily: AppFonts.kPoppins700,
                  fontSize: 12,
                ),
              ),

              SizedBox(height: 10.h),

              const Text(
                'Tomorrow, 12:00 AM',
                style: TextStyle(fontFamily: AppFonts.kPoppins500),
              ),

              SizedBox(height: 10.h),

              // waiting room
              const WaitingRoom(),

              SizedBox(height: 20.h),

              Row(
                children: [
                  SizedBox(
                    height: 30.h,
                    width: 100.w,
                    child: customElevatedButton(
                      context,
                      title: 'Join Now',
                      fontSize: 6,
                      onPressed: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Auction3(),
                        ),
                        (route) => false,
                      ),
                      backgroundColor: AppColors.kLightBlue,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  SizedBox(
                    height: 30.h,
                    width: 100.w,
                    child: customElevatedButton(
                      context,
                      title: 'Let me know',
                      fontSize: 6,
                      onPressed: () {},
                      backgroundColor: AppColors.kGray,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Invite Friends',
                          style: TextStyle(
                            color: AppColors.kLightBlue,
                            fontSize: 6,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        const Icon(Icons.ios_share, size: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WaitingRoom extends StatelessWidget {
  const WaitingRoom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Waiting room~ ',
          style: TextStyle(
            fontFamily: AppFonts.kPoppins700,
            fontSize: 20,
          ),
        ),
        Text(
          'Ahmed',
          style: TextStyle(
            fontFamily: AppFonts.kPoppins700,
            color: AppColors.kGray,
          ),
        ),
      ],
    );
  }
}

class UserDataWhoMakeHost extends StatelessWidget {
  const UserDataWhoMakeHost({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.kGray.withOpacity(.3),
      ),
      child: Row(
        children: [
          // user avatar
          const CircleAvatar(
            backgroundColor: AppColors.kBlack,
          ),

          SizedBox(width: 10.w),

          // user name
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Ahmed',
                style: TextStyle(
                  fontFamily: AppFonts.kPoppins500,
                ),
              ),
              Text(
                'Host',
                style: TextStyle(
                  color: AppColors.kGray,
                  fontFamily: AppFonts.kPoppins400,
                ),
              ),
            ],
          ),

          const Spacer(),

          // mic
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.kGray.withOpacity(.3),
            ),
            child: const Icon(
              Icons.mic,
              color: AppColors.kRed,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/utils/icons.dart';

class Auction5 extends StatelessWidget {
  const Auction5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live auction offers'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 50.h,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                separatorBuilder: (context, index) => SizedBox(width: 20.w),
                itemBuilder: (context, index) => Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text('Electronics'),
                ),
              ),
            ),

            SizedBox(height: 30.h),

            // There are no live shows at the moment
            const Text(
              'There are no live shows at the moment',
              style: TextStyle(
                fontFamily: AppFonts.kPoppins500,
                fontSize: 12,
                color: AppColors.kGray,
              ),
            ),

            SizedBox(height: 30.h),

            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppIcons.kVoice),
            ),

            SizedBox(height: 30.h),

            // start live streaming now
            const Text(
              'Start live streaming now',
              style: TextStyle(
                fontFamily: AppFonts.kPoppins500,
                color: AppColors.kRed,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

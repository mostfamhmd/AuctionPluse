import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/view/schedule_live_view.dart';
import 'package:smart_auction/feature/Streaming%20Now%20View/presentation/view/streaming_now_view.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/name_page_dialog.dart';

class AuctionButton extends StatelessWidget {
  const AuctionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 80.0,
      decoration: const BoxDecoration(shape: BoxShape.circle),
      child: FittedBox(
        child: FloatingActionButton(
          elevation: 30,
          shape: const CircleBorder(),
          backgroundColor: AppColors.kWhite,
          onPressed: () {
            showDialog(
              context: context,
              builder: ((context) => AlertDialog(
                    title: Center(
                      child: Text(
                        "Auction",
                        style: AppStyles.kPoppins700.copyWith(
                          fontSize: 20.sp,
                          color: AppColors.kLightBlue,
                        ),
                      ),
                    ),
                    content: Container(
                      width: MediaQuery.sizeOf(context).width - 50.w,
                      height: 250.h,
                      decoration: BoxDecoration(
                        color: AppColors.kWhite,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        children: [
                          const Spacer(),
                          InkWell(
                            child: const NamePageDialog(
                              namePage: "Start live streaming now",
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const StreamingNowView(),
                                ),
                              );
                            },
                          ),
                          const Spacer(),
                          const Divider(
                            thickness: 2,
                            color: AppColors.kGray,
                          ),
                          const Spacer(),
                          InkWell(
                            child: const NamePageDialog(
                              namePage: "Schedule a live show",
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ScheduleLiveView(),
                                ),
                              );
                            },
                          ),
                          const Spacer()
                        ],
                      ),
                    ),
                  )),
            );
          },
          child: SvgPicture.asset(
            AppIcons.kAuction,
            height: 35.h,
            width: 40.w,
          ),
        ),
      ),
    );
  }
}

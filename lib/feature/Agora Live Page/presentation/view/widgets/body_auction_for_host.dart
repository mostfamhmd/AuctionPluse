// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slide_countdown/slide_countdown.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/my_big_btn.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/feature/Agora%20Live%20Page/data/models/auction_model.dart';
import 'package:smart_auction/feature/Agora%20Live%20Page/presentation/managers/Auction%20Cubit/create_auction_cubit.dart';

class BodyAuctionForHost extends StatelessWidget {
  const BodyAuctionForHost({
    super.key,
    required this.auction,
  });
  final AuctionModel auction;
  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateAuctionCubit, UpdateAuctionState>(
      listener: (context, state) {
        if (state is UpdateAuctionSuccess) {
          mySuccessSnackBar(context, "Sended Successfully");
        } else if (state is UpdateAuctionError) {
          myErrorSnackBar(context, state.message);
        } else if (state is UpdateAuctionLoading) {
          myLoadingSnackBar(context, "Sending...");
        }
      },
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        color: AppColors.kWhite,
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                children: [
                  Text(
                    auction.product!.name!,
                    style: TextStyle(
                      color: AppColors.kBlack,
                      fontSize: 16.sp,
                      fontFamily: AppFonts.kPoppins700,
                    ),
                  ),
                  const Spacer(),
                  SlideCountdownSeparated(
                    onDone: () async {
                      context.read<UpdateAuctionCubit>().updateAuction(
                          auctionID: auction.sId!,
                          ended: true,
                          started: false,
                          increaseBidBy: auction.increaseBidBy,
                          highestBid: auction.increaseBidBy,
                          userID: auction.winner!.sId,
                          duration: 0);
                    },
                    duration: Duration(seconds: auction.duration!),
                    style: AppStyles.kPoppins700.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.kBlack,
                    ),
                    separator: ":",
                    separatorStyle: AppStyles.kPoppins700.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.kBlack,
                    ),
                    separatorPadding: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                      color: AppColors.kWhite,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5.r),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            MyBigBTN(
              nameBTN: "Highest bid",
              onTap: () {
                context.read<UpdateAuctionCubit>().updateAuction(
                    auctionID: auction.sId!,
                    ended: true,
                    started: true,
                    increaseBidBy: auction.increaseBidBy,
                    userID: auction.winner!.sId,
                    highestBid: auction.increaseBidBy,
                    duration: 0);
              },
            ),
          ],
        ),
      ),
    );
  }
}

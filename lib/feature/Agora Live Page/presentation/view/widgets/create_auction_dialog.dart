// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/core/widgets/Components/my_custom_field.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/feature/Agora%20Live%20Page/data/models/auction_model.dart';
import 'package:smart_auction/feature/Agora%20Live%20Page/presentation/managers/Auction%20Cubit/create_auction_cubit.dart';
import 'package:smart_auction/feature/Agora%20Live%20Page/presentation/view/widgets/close_and_dond_b_t_n.dart';
import 'package:smart_auction/feature/Agora%20Live%20Page/presentation/view/widgets/time_button.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/room.dart';

Future<dynamic> createAuctionDialog(BuildContext context,
    {required String roomID,
    List<ProductIds>? productIds,
    AuctionModel? auctionModel}) {
  TextEditingController basePrice = TextEditingController();
  TextEditingController timer = TextEditingController();
  TextEditingController duration = TextEditingController();
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        "Auction Settings",
        style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            fontFamily: AppFonts.kPoppins500),
      ),
      content: SizedBox(
        width: double.maxFinite,
        height: 300.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              productIds!.first.name!,
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kLightBlue,
                  fontFamily: AppFonts.kPoppins500),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Quantity : ${productIds.first.quantity}",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.kGray,
                  fontFamily: AppFonts.kPoppins500),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  "Initial bid",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kBlack,
                      fontFamily: AppFonts.kPoppins500),
                ),
                const Spacer(),
                Text(
                  "The time",
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.kBlack,
                      fontFamily: AppFonts.kPoppins500),
                ),
                const Spacer(),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Expanded(
                    child: MyCustomField(
                  keyboardType: TextInputType.number,
                  myController: basePrice,
                  textAlign: TextAlign.start,
                  hintText:
                      "> ${(auctionModel?.baseprice) ?? (productIds.first.price)}",
                )),
                SizedBox(
                  width: 15.w,
                ),
                Expanded(
                    child: MyCustomField(
                  myController: duration,
                  readOnly: true,
                  textAlign: TextAlign.start,
                  hintText: 'Select Duration',
                )),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                TimeButton(
                  time: "30 s",
                  onTap: () {
                    timer.text = 30.toString();
                    duration.text = "30 s";
                  },
                ),
                TimeButton(
                  time: "2 m",
                  onTap: () {
                    timer.text = (2 * 60).toString();
                    duration.text = "2 m";
                  },
                ),
                TimeButton(
                  time: "3 m",
                  onTap: () {
                    timer.text = (3 * 60).toString();
                    duration.text = "3 m";
                  },
                ),
                TimeButton(
                  time: "4 m",
                  onTap: () {
                    timer.text = (4 * 60).toString();
                    duration.text = "4 m";
                  },
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            BlocListener<UpdateAuctionCubit, UpdateAuctionState>(
              listener: (context, state) {
                if (state is UpdateAuctionSuccess) {
                  mySuccessSnackBar(context, "Updated Successfully");
                  Navigator.pop(context);
                } else if (state is UpdateAuctionLoading) {
                  myLoadingSnackBar(context, "Loading ...");
                } else if (state is UpdateAuctionError) {
                  myErrorSnackBar(context, state.message);
                }
              },
              child: BlocListener<CreateAuctionCubit, CreateAuctionState>(
                listener: (context, state) {
                  if (state is CreateAuctionSuccess) {
                    mySuccessSnackBar(context, "Created Successfully");
                    Navigator.pop(context);
                  } else if (state is CreateAuctionLoading) {
                    myLoadingSnackBar(context, "Loading ...");
                  } else if (state is CreateAuctionError) {
                    myErrorSnackBar(context, state.message);
                  }
                },
                child: CloseAndDondBTN(
                  onDoneTap: () {
                    if (basePrice.text.isNotEmpty && timer.text.isNotEmpty) {
                      if (auctionModel != null) {
                        context.read<UpdateAuctionCubit>().updateAuction(
                            auctionID: auctionModel.sId!,
                            basePrice: basePrice.text,
                            ended: false,
                            started: true,
                            duration: int.parse(timer.text));
                      } else {
                        context.read<CreateAuctionCubit>().createAuction(
                            roomID: roomID,
                            productID: productIds.first.id!,
                            basePrice: basePrice.text,
                            duration: int.parse(timer.text));
                      }
                    } else {
                      myErrorSnackBar(context,
                          "Make sure you have written the initial price and selected the duration.");
                    }
                  },
                  onCloseTap: () {
                    Navigator.pop(context);
                  },
                  doneNameBTN: "Start Auction",
                  closeNameBTN: "Cancel",
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

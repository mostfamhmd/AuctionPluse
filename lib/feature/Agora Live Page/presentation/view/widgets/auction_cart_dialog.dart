// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/image_component.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/room.dart';

import 'create_auction_dialog.dart';

Future<dynamic> auctionCartDialog(BuildContext context,
    {required String roomID, List<ProductIds>? productIds}) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            content: SizedBox(
                height: 70.h,
                child: InkWell(
                  onTap: () {
                    createAuctionDialog(context,
                        roomID: roomID, productIds: productIds);
                  },
                  child: Row(
                    children: [
                      ImageComponent(
                          urlImage: productIds!.first.imageCover!,
                          height: 50.h,
                          width: 50.w,
                          radius: 10.r),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Text(
                            productIds.first.name!,
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.kInter400.copyWith(
                                fontSize: 16.sp, color: AppColors.kBlack),
                          ),
                          const Spacer(),
                          Text(
                            "${productIds.first.price!} EGP   ${productIds.first.discountedPrice} EGP",
                            overflow: TextOverflow.ellipsis,
                            style: AppStyles.kInter400.copyWith(
                                fontSize: 12.sp, color: AppColors.kGray),
                          ),
                          const Spacer(),
                        ],
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        AppIcons.kAuction,
                        height: 30.h,
                        width: 50.w,
                      ),
                    ],
                  ),
                )),
          ));
}

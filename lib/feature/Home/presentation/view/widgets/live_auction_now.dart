// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/consts.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/image_component.dart';
import 'package:smart_auction/feature/Agora%20Live%20Page/presentation/view/agora_live_page.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/room.dart';

class LiveAuctionNow extends StatelessWidget {
  const LiveAuctionNow({
    super.key,
    required this.scheduleLive,
  });

  final List<Room> scheduleLive;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 10.w,
        children: List.generate(
          scheduleLive.length <= 3 ? scheduleLive.length : 3,
          (index) => InkWell(
            onTap: () async {
              String? userId = await AppConsts.getData(AppConsts.kUserId);
              bool isBroad = false;
              if (userId != null) {
                for (int i = 0; i < scheduleLive[index].hostIds!.length; i++) {
                  if (userId == scheduleLive[index].hostIds![i].id) {
                    isBroad = true;
                    break;
                  }
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AgoraLivePage(
                            isBroad: isBroad,
                            userID: userId,
                            usersID: scheduleLive[index]
                                .userIds!
                                .map((user) => user.id!)
                                .toList(),
                            idRoom: scheduleLive[index].id!,
                            agoraToken: scheduleLive[index].agoraToken!,
                            rtmToken: scheduleLive[index].rtmToken,
                            title: scheduleLive[index].title!)));
                if (kDebugMode) {
                  print("isBraod $isBroad");
                  print("userID $userId");
                  print("roomID ${scheduleLive[index].id}");
                  print("agoraToken ${scheduleLive[index].agoraToken}");
                  print("rtmToken ${scheduleLive[index].rtmToken}");
                  print("title ${scheduleLive[index].title}");
                }
              }
            },
            child: SizedBox(
              height: 120.h,
              width: 100.w,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    ImageComponent(
                        urlImage: scheduleLive[index].productIds!.isNotEmpty
                            ? scheduleLive[index]
                                    .productIds
                                    ?.first
                                    .imageCover ??
                                ""
                            : "",
                        height: 70.h,
                        width: 65.w,
                        radius: 20.w),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      scheduleLive[index].title!,
                      style: AppStyles.kPoppins500.copyWith(
                        color: AppColors.kBlack,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

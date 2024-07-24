import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/widgets/Components/my_small_btn.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/feature/Agora%20Live%20Page/presentation/view/agora_live_page.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/managers/Update%20Room%20Cubit/update_room_cubit.dart';
import 'package:smart_auction/feature/Waiting%20Room/data/models/wanted_event_model.dart';
import 'package:smart_auction/feature/Waiting%20Room/presentation/view/widgets/host_state.dart';
import 'package:smart_auction/feature/Waiting%20Room/presentation/view/widgets/show_product.dart';
import 'package:smart_auction/feature/Waiting%20Room/presentation/view/widgets/show_waiting_users.dart';
import 'package:smart_auction/feature/Waiting%20Room/presentation/view/widgets/waiting_message.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/view/schedule_live_view.dart';

class BodyHost extends StatelessWidget {
  const BodyHost({
    super.key,
    required this.widget,
    required this.wantedRoom,
    required this.title,
    required this.contAddress,
  });

  final HostState widget;
  final WantedEventModel wantedRoom;
  final ValueNotifier title;
  final TextEditingController contAddress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        waitingMessage(
          isBroad: widget.isBroad,
          timeStartingLive:
              "${DateTime.fromMillisecondsSinceEpoch(wantedRoom.eventDate!).year}/${DateTime.fromMillisecondsSinceEpoch(wantedRoom.eventDate!).month}/${DateTime.fromMillisecondsSinceEpoch(wantedRoom.eventDate!).day}   ${DateTime.fromMillisecondsSinceEpoch(wantedRoom.eventDate!).hour}:${DateTime.fromMillisecondsSinceEpoch(wantedRoom.eventDate!).minute}",
        ),
        SizedBox(
          height: 10.h,
        ),
        if (wantedRoom.userIds!.isNotEmpty)
          ShowWaitingUsers(
            wantedRoom: wantedRoom,
          ),
        SizedBox(
          height: 20.h,
        ),
        if (wantedRoom.productIds!.isNotEmpty)
          ShowProduct(
            wantedRoom: wantedRoom,
          ),
        SizedBox(
          height: 10.h,
        ),
        BlocListener<UpdateRoomCubit, UpdateRoomState>(
          listener: (context, state) {
            if (state is UpdateRoomSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => AgoraLivePage(
                    isBroad: widget.isBroad,
                    userID: widget.userID,
                    idRoom: wantedRoom.sId!,
                    agoraToken: wantedRoom.agoraToken ?? "",
                    rtmToken: wantedRoom.rtmToken ?? "",
                    title: wantedRoom.title!,
                  ),
                ),
              );
            }
            if (state is UpdateRoomError) {
              myErrorSnackBar(context, state.errorMessage);
            }
            if (state is UpdateRoomLoading) {
              myLoadingSnackBar(context, "Loading to update your room");
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: MySmallBTN(
                  onTap: () {
                    context
                        .read<UpdateRoomCubit>()
                        .updateRoom(roomId: wantedRoom.sId!, event: true);
                  },
                  nameButton: "Start Live",
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScheduleLiveView(
                                  wantedRoom: wantedRoom,
                                )));
                  },
                  icon: Icon(
                    size: 35.sp,
                    Icons.edit,
                    color: AppColors.kBlue,
                  ))
            ],
          ),
        ),
      ],
    );
  }
}

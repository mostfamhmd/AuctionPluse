// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'dart:math';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/icons.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/core/widgets/Components/shimmer_loading.dart';
import 'package:smart_auction/feature/Agora%20Live%20Page/data/models/auction_model.dart';
import 'package:smart_auction/feature/Agora%20Live%20Page/data/services/auction_service.dart';
import 'package:smart_auction/feature/Agora%20Live%20Page/presentation/view/widgets/close_and_dond_b_t_n.dart';
import 'package:smart_auction/feature/Waiting%20Room/data/models/wanted_event_model.dart';
import 'package:smart_auction/feature/Waiting%20Room/data/services/get_wanted_room_service.dart';
import 'package:smart_auction/feature/Waiting%20Room/data/services/update_wanted_room.dart';
import 'package:smart_auction/feature/Waiting%20Room/presentation/manager/RemoveHandCubit/remove_user_from_raised_hand_cubit.dart';
import 'package:smart_auction/feature/Waiting%20Room/presentation/view/widgets/leave_b_t_n.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/managers/Update%20Room%20Cubit/update_room_cubit.dart';
import 'package:smart_auction/feature/Streaming%20Now%20View/presentation/view/streaming_now_view.dart';

import 'auction_cart_dialog.dart';
import 'body_auction_for_host.dart';
import 'body_auction_for_user.dart';
import 'close_live_dialog.dart';
import 'create_auction_dialog.dart';
import 'icon_live_button.dart';
import 'list_users_raised_and_speaker.dart';
import 'raised_hand_users_dialog.dart';
import 'speakers_users_dialog.dart';

class BodyAgoraLivePage extends StatefulWidget {
  BodyAgoraLivePage({
    super.key,
    required this.isBroad,
    required this.userID,
    required this.agoraToken,
    required this.title,
    this.rtmToken,
    required this.roomID,
    this.users,
  });
  ValueNotifier<bool> isBroad;
  final String userID;
  final String agoraToken;
  final String title;
  final String? rtmToken;
  final String roomID;
  final List<String>? users;

  @override
  State<BodyAgoraLivePage> createState() => _BodyAgoraLivePageState();
}

class _BodyAgoraLivePageState extends State<BodyAgoraLivePage> {
  String appId = 'eaa1810d9a4a477d97053548a5ef7819';
  AgoraClient? client;
  int uid = Random().nextInt(43);

  agoraClient(
      {required String channelName,
      required String token,
      String? rtmToken,
      required int uid}) async {
    AgoraClient host = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        uid: uid,
        appId: appId,
        channelName: channelName,
        tempToken: token,
        tempRtmToken: rtmToken,
        rtmEnabled: true,
        screenSharingEnabled: true,
      ),
      enabledPermission: [
        Permission.camera,
        Permission.microphone,
      ],
      agoraChannelData: AgoraChannelData(
        channelProfileType: ChannelProfileType.channelProfileGame,
        clientRoleType: ClientRoleType.clientRoleBroadcaster,
      ),
    );
    AgoraClient user = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        uid: uid,
        appId: appId,
        channelName: channelName,
        tempToken: token,
      ),
      enabledPermission: [],
      agoraChannelData: AgoraChannelData(
        channelProfileType: ChannelProfileType.channelProfileLiveBroadcasting,
        clientRoleType: ClientRoleType.clientRoleAudience,
      ),
    );
    client = widget.isBroad.value ? host : user;
  }

  @override
  void initState() {
    agoraClient(
        channelName: widget.title,
        token: widget.agoraToken,
        rtmToken: widget.rtmToken,
        uid: uid);
    super.initState();
    initAgora();
    if (widget.isBroad.value != true) {
      for (int i = 0; i < widget.users!.length; i++) {
        if (widget.users?[i] != widget.userID) {
          widget.users?.add(widget.userID);
          UpdateWantedRoomService().updateWantedRoom(
            roomID: widget.roomID,
            event: true,
            users: widget.users,
          );
          break;
        }
      }
    }
  }

  @override
  void dispose() {
    initAgora();
    super.dispose();
  }

  toggleMic() async {
    var status = await Permission.microphone.status;
    if (client!.sessionController.value.isLocalUserMuted && status.isDenied) {
      await Permission.microphone.request();
    }
    client!.sessionController.value = client!.sessionController.value.copyWith(
        isLocalUserMuted: !(client!.sessionController.value.isLocalUserMuted));
    await client!.sessionController.value.engine?.muteLocalAudioStream(
        client!.sessionController.value.isLocalUserMuted);
  }

  void initAgora() async {
    await client!.initialize();
  }

  TextEditingController myBid = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Stream<WantedEventModel?> wantedRoomStream =
        GetWantedRoomService().getWantedRoom22(roomID: widget.roomID);
    setState(() {});
    return SafeArea(
      child: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: widget.isBroad,
            builder: (BuildContext context, value, Widget? child) =>
                AgoraVideoViewer(
              renderModeType: RenderModeType.renderModeHidden,
              layoutType: value ? Layout.floating : Layout.grid,
              client: client!,
              showNumberOfUsers: true,
            ),
          ),
          Positioned(
            top: 350.h,
            right: 20.w,
            left: 20.w,
            child: StreamBuilder(
                stream: wantedRoomStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center();
                  } else if (snapshot.hasData) {
                    WantedEventModel liveModel = snapshot.data!;
                    /////////////////////////// check if user is host or not ///////////////////////////
                    for (int i = 0; i < liveModel.hostIds!.length; i++) {
                      if (liveModel.hostIds![i].sId == widget.userID) {
                        widget.isBroad.value = true;
                        break;
                      }
                    }
                    /////////////////////////// check if user in list of speakers or not ///////////////////////////
                    for (int i = 0; i < liveModel.speakerIds!.length; i++) {
                      if (liveModel.speakerIds![i].sId == widget.userID) {
                        toggleMic();
                        break;
                      }
                    }
                    /////////////////////////// check if user in list of audience or not ///////////////////////////
                    if (liveModel.event == false) {
                      Navigator.pop(context);
                      client!.engine.leaveChannel();
                    }

                    final Stream<AuctionModel> getAuctionOfRoom =
                        AuctionService()
                            .getAuctionByRoomID(roomID: widget.roomID);
                    return StreamBuilder<AuctionModel>(
                        stream: getAuctionOfRoom,
                        builder: (context, snapshot) {
                          ValueNotifier<AuctionModel?> auctionModel =
                              ValueNotifier(snapshot.data);

                          return ValueListenableBuilder(
                            valueListenable: widget.isBroad,
                            builder:
                                (BuildContext context, value, Widget? child) =>
                                    ValueListenableBuilder(
                              valueListenable: auctionModel,
                              builder: (BuildContext context,
                                      AuctionModel? auction, Widget? child) =>
                                  Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            /////////////////////////// if user => list for show users exist in live ///////////////////////////
                                            /////////////////////////// if host => list for show users exist in live with Full control ///////////////////////////
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 30.h),
                                              child: InkWell(
                                                onTap: () async {
                                                  allUsersDialog(context,
                                                      roomID: liveModel.sId!,
                                                      allUsers:
                                                          liveModel.userIds);
                                                },
                                                child: const IconLiveButton(
                                                  icon: Icons.person,
                                                ),
                                              ),
                                            ),
                                            /////////////////////////// if host => show list of users raised hands ///////////////////////////
                                            /////////////////////////// if user => send request to add user to list by his id ///////////////////////////
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 30.h),
                                              child: InkWell(
                                                onTap: () async {
                                                  if (value == true) {
                                                    await raisedHandUsersDialog(
                                                        context,
                                                        raisedHandUsers:
                                                            liveModel
                                                                .raisedHands,
                                                        roomID: liveModel.sId!);
                                                  } else {
                                                    context
                                                        .read<UpdateRoomCubit>()
                                                        .updateRoom(
                                                          roomId:
                                                              liveModel.sId!,
                                                          idRaisedHand:
                                                              widget.userID,
                                                        );
                                                  }
                                                },
                                                child: const IconLiveButton(
                                                  icon: AppIcons.kRaiseHand,
                                                ),
                                              ),
                                            ),
                                            /////////////////////////// show speakers in list for host only ///////////////////////////
                                            if (value == true)
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 30.h),
                                                child: InkWell(
                                                  onTap: () async {
                                                    speakersUsersDialog(
                                                      context,
                                                      roomID: liveModel.sId!,
                                                      speakersUsers:
                                                          liveModel.speakerIds,
                                                    );
                                                  },
                                                  child: const IconLiveButton(
                                                    icon:
                                                        Icons.record_voice_over,
                                                  ),
                                                ),
                                              ),
                                            if (value == true)
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 30.h),
                                                child: InkWell(
                                                  onTap: () async {
                                                    createAuctionDialog(context,
                                                        roomID: liveModel.sId!,
                                                        productIds: liveModel
                                                            .productIds,
                                                        auctionModel: auction);
                                                  },
                                                  child: const IconLiveButton(
                                                    icon: AppIcons.kAuction,
                                                  ),
                                                ),
                                              ),
                                          ]),
                                      Column(
                                        children: [
                                          /////////////////////////// Camera for Host only ///////////////////////////
                                          if (value == true)
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 30.h),
                                              child: InkWell(
                                                onTap: () async {
                                                  var status = await Permission
                                                      .camera.status;
                                                  if (status.isDenied) {
                                                    await Permission.camera
                                                        .request();
                                                  }
                                                  await client!
                                                      .sessionController
                                                      .value
                                                      .engine
                                                      ?.switchCamera();
                                                },
                                                child: const IconLiveButton(
                                                  icon: AppIcons.kSwitch,
                                                ),
                                              ),
                                            ),
                                          /////////////////////////// Mic for Host and User ///////////////////////////
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 30.h),
                                            child: InkWell(
                                              onTap: () async {
                                                if (value == true) {
                                                  await toggleMic();
                                                } else {
                                                  myErrorSnackBar(context,
                                                      "press on hand up to host allow to you");
                                                }
                                              },
                                              child: ValueListenableBuilder(
                                                valueListenable:
                                                    client!.sessionController,
                                                builder: (BuildContext context,
                                                        value, Widget? child) =>
                                                    IconLiveButton(
                                                  icon: value.isLocalUserMuted
                                                      ? AppIcons.kUnMute
                                                      : AppIcons.kMute,
                                                ),
                                              ),
                                            ),
                                          ),
                                          /////////////////////////// editing live for host only ///////////////////////////
                                          if (value == true)
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 30.h),
                                              child: InkWell(
                                                onTap: () async {
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              StreamingNowView(
                                                                wantedEventModel:
                                                                    liveModel,
                                                              )));

                                                  client!.engine.leaveChannel();
                                                },
                                                child: const IconLiveButton(
                                                  icon: AppIcons.kLive,
                                                ),
                                              ),
                                            ),
                                          /////////////////////////// create auction for host only ///////////////////////////
                                          if (value == true)
                                            InkWell(
                                              onTap: () async {
                                                auctionCartDialog(context,
                                                    roomID: liveModel.sId!,
                                                    productIds:
                                                        liveModel.productIds);
                                              },
                                              child: const IconLiveButton(
                                                icon: AppIcons.kAuctionCart,
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 60.h,
                                  ),
                                  if (auction != null && value == true)
                                    BodyAuctionForHost(
                                      auction: auction,
                                    )
                                  else if (value == false && auction != null)
                                    BodyAuctionForUser(
                                      myBid: myBid,
                                      auction: auction,
                                      userID: widget.userID,
                                    )
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    return const Center();
                  }
                }),
          ),
          /////////////////////////// if user => leave live and delete his id from list of users in live and disConnect live ///////////////////////////
          /////////////////////////// if host => show pop up to delete live and disConnect live or leave and disConnect live only ///////////////////////////
          ValueListenableBuilder(
            valueListenable: widget.isBroad,
            builder: (BuildContext context, value, Widget? child) => Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextButton(
                    onPressed: () async {
                      if (value == true) {
                        closeLiveDialog(context,
                            roomID: widget.roomID, client: client!);
                      } else {
                        Navigator.pop(context);
                        await client!.engine.leaveChannel();
                        client!.sessionController.removeUser(uid: uid);
                        await client!.release();
                      }
                    },
                    child: LeaveBTN(leave: value ? "End Live" : "Leave")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<dynamic> allUsersDialog(
  BuildContext context, {
  List<InvitedhostIds>? allUsers,
  required String roomID,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      List<String> selectedUsers = [];
      return AlertDialog(
        title: const FailureState(error: "press on done to confirm"),
        content: SizedBox(
          width: double.maxFinite,
          child: BlocBuilder<RemoveUserFromLiveCubit, RemoveUserFromLiveState>(
            builder: (context, state) {
              if (state is RemoveUserFromLiveSuccess) {
                return state.updateLiveAfterRemoveUser.raisedHands!.isNotEmpty
                    ? ListUsersRaisedAndSpeaker(
                        selectedUsers: selectedUsers,
                        icon: Icons.logout,
                        usersID: state.updateLiveAfterRemoveUser.raisedHands!)
                    : const FailureState(error: "Empty Raised Hands");
              } else if (state is RemoveUserFromRaisedHandLoading) {
                return const ShimmerLoading();
              } else {
                return allUsers != null || allUsers!.isNotEmpty
                    ? ListUsersRaisedAndSpeaker(
                        selectedUsers: selectedUsers,
                        icon: Icons.logout,
                        usersID: allUsers.map((e) => e.sId!).toList())
                    : const FailureState(error: "Empty Raised Hands");
              }
            },
          ),
        ),
        actions: <Widget>[
          CloseAndDondBTN(
            onCloseTap: () => Navigator.of(context).pop(),
            onDoneTap: () {
              List<Map<String, String>> raisedHandIds = [];
              for (var i = 0; i < selectedUsers.length; i++) {
                raisedHandIds.add({
                  '_id': selectedUsers[i],
                });
              }
              context.read<UpdateRoomCubit>().updateRoom(
                    roomId: roomID,
                    idSpeaker: raisedHandIds,
                  );
              context
                  .read<RemoveUserFromRaisedHandCubit>()
                  .removeUserFromRaisedHand(
                      roomID: roomID, raisedHandUserID: selectedUsers);
            },
          )
        ],
      );
    },
  );
}

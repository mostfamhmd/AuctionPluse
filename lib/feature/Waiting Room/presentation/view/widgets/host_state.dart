import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smart_auction/core/errors/server_failure.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Agora%20Live%20Page/presentation/view/agora_live_page.dart';
import 'package:smart_auction/feature/Waiting%20Room/data/models/wanted_event_model.dart';
import 'package:smart_auction/feature/Waiting%20Room/data/services/get_wanted_room_service.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/room.dart';

import 'body_host.dart';

class HostState extends StatefulWidget {
  const HostState(
      {super.key,
      required this.isBroad,
      required this.room,
      required this.userID});
  final bool isBroad;
  final Room room;
  final String userID;

  @override
  State<HostState> createState() => _HostStateState();
}

class _HostStateState extends State<HostState> {
  final contAddress = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Stream<WantedEventModel> wantedRoomStream =
        GetWantedRoomService().getWantedRoom22(roomID: widget.room.id!);
    return StreamBuilder(
      stream: wantedRoomStream,
      builder:
          (BuildContext context, AsyncSnapshot<WantedEventModel> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingState();
        } else if (snapshot.hasData) {
          WantedEventModel wantedRoom = snapshot.data!;
          if (wantedRoom.event == true) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
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
            });
            return const Center();
          } else {
            ValueNotifier title = ValueNotifier(wantedRoom.title!);
            return BodyHost(
                widget: widget,
                wantedRoom: wantedRoom,
                title: title,
                contAddress: contAddress);
          }
        } else {
          if (snapshot.error is DioException) {
            ServerFailure serverFailure = ServerFailure.fromDioException(
                dioException: snapshot.error as DioException);
            return FailureState(error: serverFailure.errMessage);
          } else {
            ServerFailure serverFailure = ServerFailure(
              errMessage: snapshot.error.toString(),
            );
            return FailureState(error: serverFailure.errMessage);
          }
        }
      },
    );
  }
}

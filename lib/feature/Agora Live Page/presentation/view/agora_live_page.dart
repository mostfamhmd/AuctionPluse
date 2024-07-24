import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/feature/Waiting%20Room/presentation/manager/RemoveHandCubit/remove_user_from_raised_hand_cubit.dart';
import 'package:smart_auction/feature/Schedule%20Live%20View/presentation/managers/Update%20Room%20Cubit/update_room_cubit.dart';

import 'widgets/body_agora_live_page.dart';

class AgoraLivePage extends StatelessWidget {
  const AgoraLivePage(
      {super.key,
      required this.isBroad,
      required this.userID,
      required this.agoraToken,
      required this.title,
      this.rtmToken,
      required this.idRoom,
      this.usersID});
  final bool isBroad;
  final String userID;
  final String agoraToken;
  final String title;
  final String? rtmToken;
  final String idRoom;
  final List<String>? usersID;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RemoveUserFromRaisedHandCubit(),
        ),
        BlocProvider(
          create: (context) => UpdateRoomCubit(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: BodyAgoraLivePage(
          users: usersID,
          agoraToken: agoraToken,
          title: title,
          rtmToken: rtmToken,
          isBroad: ValueNotifier(isBroad),
          userID: userID,
          roomID: idRoom,
        ),
      ),
    );
  }
}

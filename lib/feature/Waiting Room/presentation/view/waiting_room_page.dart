import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Waiting%20Room/presentation/view/widgets/body_live_show.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/room.dart';

class WaitingRoomPage extends StatefulWidget {
  const WaitingRoomPage(
      {super.key,
      required this.isBroad,
      required this.room,
      required this.userID});
  final bool isBroad;
  final Room room;
  final String userID;
  @override
  State<WaitingRoomPage> createState() => _WaitingRoomPageState();
}

class _WaitingRoomPageState extends State<WaitingRoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: backAppBar(context, "Waiting Room"),
      body: BodyLiveShow(
        room: widget.room,
        isBroad: widget.isBroad,
        userID: widget.userID,
      ),
    );
  }
}

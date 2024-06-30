import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Live%20Show%20View/presentation/view/widgets/body_live_show.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/room.dart';

class LiveShowView extends StatefulWidget {
  const LiveShowView(
      {super.key,
      required this.isBroad,
      required this.room,
      required this.userID});
  final bool isBroad;
  final Room room;
  final String userID;
  @override
  State<LiveShowView> createState() => _LiveShowViewState();
}

class _LiveShowViewState extends State<LiveShowView> {
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

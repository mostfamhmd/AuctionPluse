import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/data/models/all_rooms_models/room.dart';

import 'host_state.dart';
import 'user_state.dart';

class BodyLiveShow extends StatelessWidget {
  const BodyLiveShow({
    super.key,
    required this.isBroad,
    required this.room,
    required this.userID,
  });
  final bool isBroad;
  final Room room;
  final String userID;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
      ),
      child: Center(
        child: Column(
          children: [
            const Spacer(),
            isBroad
                ? HostState(
                    isBroad: isBroad,
                    room: room,
                    userID: userID,
                  )
                : UserState(
                    isBroad: isBroad,
                    room: room,
                    userID: userID,
                  ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

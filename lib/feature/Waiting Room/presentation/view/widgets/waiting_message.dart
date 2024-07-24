import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'time_starting_live.dart';
import 'wait_to_start.dart';

Column waitingMessage({
  required String timeStartingLive,
  required bool isBroad,
}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      // Wait for the host to start th show
      WaitToStart(
        statement: isBroad
            ? "The Show is going to start in"
            : "Wait for the host to start the show",
      ),
      SizedBox(height: 15.h),
      TimeStartingLive(
        timeStartingLive: timeStartingLive,
      ),
    ],
  );
}

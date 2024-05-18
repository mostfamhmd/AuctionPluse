import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'time_starting_live.dart';
import 'wait_to_start.dart';

Expanded waitingMessage({required String timeStartingLive}) {
  return Expanded(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Wait for the host to start th show
        const WaitToStart(),
        SizedBox(height: 15.h),
        TimeStartingLive(
          timeStartingLive: timeStartingLive,
        ),
      ],
    ),
  );
}

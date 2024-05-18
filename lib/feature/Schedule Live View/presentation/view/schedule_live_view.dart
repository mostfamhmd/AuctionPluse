import 'package:flutter/material.dart';

import 'widgets/body_schedule_live_view.dart';

class ScheduleLiveView extends StatelessWidget {
  const ScheduleLiveView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyScheduleLiveView(),
    );
  }
}

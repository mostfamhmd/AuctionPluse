import 'package:flutter/material.dart';

import 'widgets/body_live_show.dart';

class LiveShowView extends StatelessWidget {
  const LiveShowView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyLiveShow(),
    );
  }
}

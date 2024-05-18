import 'package:flutter/material.dart';
import 'package:smart_auction/feature/Streaming%20Now%20View/presentation/view/widgets/app_bar_streaming.dart';

import 'widgets/body_streaming_now.dart';

class StreamingNowView extends StatelessWidget {
  const StreamingNowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarStreamingNow(context),
      body: const BodyStreamingNow(),
    );
  }
}

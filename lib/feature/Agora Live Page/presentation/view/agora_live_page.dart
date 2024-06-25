import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';

import 'widgets/body_agora_live_page.dart';

class AgoraLivePage extends StatelessWidget {
  const AgoraLivePage(
      {super.key,
      required this.isBroad,
      required this.userID,
      required this.agoraToken,
      required this.title,
      this.rtmToken});
  final bool isBroad;
  final String userID;
  final String agoraToken;
  final String title;
  final String? rtmToken;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(context, title),
      body: BodyAgoraLivePage(
        agoraToken: agoraToken,
        title: title,
        rtmToken: rtmToken,
        isBroad: isBroad,
        userID: userID,
      ),
    );
  }
}

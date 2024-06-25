import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

class BodyAgoraLivePage extends StatefulWidget {
  const BodyAgoraLivePage(
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
  State<BodyAgoraLivePage> createState() => _BodyAgoraLivePageState();
}

class _BodyAgoraLivePageState extends State<BodyAgoraLivePage> {
  String appId = 'eaa1810d9a4a477d97053548a5ef7819';
  AgoraClient? client;
  agoraClient(
      {required String channelName,
      required String token,
      required String rtmToken,
      required String uid}) {
    AgoraClient host = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: appId,
        channelName: channelName,
        tempToken: token,
        tempRtmToken: rtmToken,
        rtmEnabled: true,
        screenSharingEnabled: true,
      ),
      agoraChannelData: AgoraChannelData(
        channelProfileType: ChannelProfileType.channelProfileGame,
        clientRoleType: ClientRoleType.clientRoleBroadcaster,
      ),
    );
    AgoraClient user = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: appId,
        channelName: channelName,
        tempToken: token,
      ),
      agoraChannelData: AgoraChannelData(
        channelProfileType: ChannelProfileType.channelProfileLiveBroadcasting,
        clientRoleType: ClientRoleType.clientRoleAudience,
        isActiveSpeakerDisabled: true,
        muteAllRemoteAudioStreams: true,
        muteAllRemoteVideoStreams: true,
        setCameraAutoFocusFaceModeEnabled: false,
        setCameraTorchOn: false,
      ),
    );
    client = widget.isBroad ? host : user;
  }

  @override
  void initState() {
    agoraClient(
        channelName: widget.title,
        token: widget.agoraToken,
        rtmToken: widget.rtmToken ?? "",
        uid: widget.userID);
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client!.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          AgoraVideoViewer(
            layoutType: widget.isBroad ? Layout.floating : Layout.grid,
            client: client!,
            showNumberOfUsers: true,
          ),
          AgoraVideoButtons(
            client: client!,
            autoHideButtons: true,
            autoHideButtonTime: 4,
          ),
        ],
      ),
    );
  }
}

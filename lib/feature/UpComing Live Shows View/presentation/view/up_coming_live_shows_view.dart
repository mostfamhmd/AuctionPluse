import 'package:flutter/material.dart';
import 'package:smart_auction/feature/UpComing%20Live%20Shows%20View/presentation/view/widgets/appBar_up_coming_live_shows.dart';

import 'widgets/body_up_coming_live_shows.dart';

class UpComingLiveShowsView extends StatelessWidget {
  const UpComingLiveShowsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarUpComingLiveShows(context, true),
      body: const BodyUpComingLiveShows(),
    );
  }
}

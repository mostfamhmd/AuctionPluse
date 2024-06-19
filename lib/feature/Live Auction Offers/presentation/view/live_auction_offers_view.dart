import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';

import 'widgets/body_live_auction_offers.dart';

class LiveAuctionOffersView extends StatelessWidget {
  const LiveAuctionOffersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(context, 'Live auction offers'),
      body: const BodyLiveAuctionOffersView(),
    );
  }
}

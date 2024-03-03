import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Reviews%20Of%20Products/presentation/view/widgets/body_reviews_page.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const BodyReviewsPage(),
      appBar: backAppBar(context, "5 Reviews"),
    );
  }
}

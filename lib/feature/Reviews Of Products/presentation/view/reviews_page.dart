import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Details%20Product/data/model/review_model.dart';
import 'package:smart_auction/feature/Reviews%20Of%20Products/presentation/view/widgets/body_reviews_page.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key, required this.listProductReviews});
  final List<Review> listProductReviews;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyReviewsPage(
        listProductReviews: listProductReviews,
      ),
      appBar: backAppBar(context, "${listProductReviews.length} Reviews"),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Details%20Product/data/model/review_model.dart';
import 'package:smart_auction/feature/Reviews%20Of%20Products/presentation/manager/EditReviewCubit/edit_review_cubit.dart';
import 'package:smart_auction/feature/Reviews%20Of%20Products/presentation/view/widgets/body_reviews_page.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage(
      {super.key, required this.listProductReviews, required this.productId});
  final List<Review> listProductReviews;
  final String productId;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EditReviewCubit(),
        ),
      ],
      child: Scaffold(
        body: BodyReviewsPage(
          listProductReviews: listProductReviews,
          productId: productId,
        ),
        appBar: backAppBar(context, "Reviews"),
      ),
    );
  }
}

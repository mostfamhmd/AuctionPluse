import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Write%20Comments/presentation/view/widgets/body_write_comments_page.dart';

class WriteCommentsPage extends StatelessWidget {
  const WriteCommentsPage(
      {super.key,
      this.productId,
      this.reviewId,
      this.userComment,
      this.rating});
  final String? productId;
  final String? reviewId;
  final String? userComment;
  final num? rating;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAppBar(context, " Write Review"),
      body: BodyWriteCommentsPage(
        productId: productId,
        reviewId: reviewId,
        userComment: userComment,
        rating: rating,
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

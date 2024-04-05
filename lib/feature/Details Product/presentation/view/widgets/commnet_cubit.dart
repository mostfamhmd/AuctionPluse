import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Details%20Product/data/model/review_model.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/manager/Review%20Cubit/review_cubit.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/widgets/commnet_body.dart';
import 'package:smart_auction/feature/Write%20Comments/presentation/view/write_comments_page.dart';

class CommentsCubit extends StatelessWidget {
  const CommentsCubit({super.key, required this.idProduct});
  final String idProduct;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReviewCubit, ReviewState>(
      builder: (context, state) {
        if (state is ReviewSuccess) {
          List<Review> listProductReviews = [];
          for (int i = 0; i < state.reviewModel.data!.length; i++) {
            if (idProduct == state.reviewModel.data![i].product) {
              listProductReviews.add(state.reviewModel.data![i]);
            }
          }
          if (listProductReviews.isNotEmpty) {
            return CommentBody(
              productId: idProduct,
              listProductReviews: listProductReviews,
            );
          } else {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WriteCommentsPage(
                      productId: idProduct,
                    ),
                  ),
                );
              },
              child: const FailureState(error: "Write First Review"),
            );
          }
        } else if (state is ReviewFailure) {
          return FailureState(error: state.errorMessage);
        } else if (state is ReviewLoading) {
          return const LoadingState();
        } else {
          return const Center();
        }
      },
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Write%20Comments/data/Model/my_review_model.dart';
import 'package:smart_auction/feature/Write%20Comments/data/service/add_review_service.dart';

import '../../../../../core/errors/server_failure.dart';

part 'add_comment_state.dart';

class AddCommentCubit extends Cubit<AddCommentState> {
  AddCommentCubit() : super(AddCommentInitial());
  String title = "";
  String product = "";
  String user = "65e6672c48277f413a9032c3";
  num ratings = 0;
  Future<void> addNewComment({required BuildContext context}) async {
    emit(
      AddCommentLoading(),
    );
    if (title.isNotEmpty &&
        product.isNotEmpty &&
        user.isNotEmpty &&
        ratings != 0) {
      Either<ServerFailure, MyReview> result =
          await AddReviewService().addNewComment(
        title: title,
        product: product,
        user: user,
        ratings: ratings,
      );

      result.fold(
        (serverFailureMessage) => emit(
          AddCommentFailure(
            errorMessage: serverFailureMessage.errMessage,
          ),
        ),
        (myReview) => emit(
          AddCommentSuccess(
            myReview: myReview,
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Column(
            children: [
              FailureState(error: "Check your rating and comment"),
            ],
          ),
        ),
      );
    }
  }
}

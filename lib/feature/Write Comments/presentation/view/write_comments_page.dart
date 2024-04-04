import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Write%20Comments/presentation/manager/Add%20Comment%20Cubit/add_comment_cubit.dart';
import 'package:smart_auction/feature/Write%20Comments/presentation/view/widgets/body_write_comments_page.dart';

class WriteCommentsPage extends StatelessWidget {
  const WriteCommentsPage({super.key, required this.productId});
  final String productId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCommentCubit(),
      child: Scaffold(
        appBar: backAppBar(context, " Write Review"),
        body: BodyWriteCommentsPage(
          productId: productId,
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}

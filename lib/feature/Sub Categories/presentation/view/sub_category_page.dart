import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Sub%20Categories/presentation/view/manager/Fetch%20Sub%20Categories/fetch_sub_categories_cubit.dart';
import 'package:smart_auction/feature/Sub%20Categories/presentation/view/widgets/body_sub_category_page.dart';

class SubCategoryPage extends StatelessWidget {
  const SubCategoryPage({super.key, required this.categoryId});
  final String categoryId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchSubCategoriesCubit(),
      child: Scaffold(
        body: BodySubCategoryPage(
          categoryId: categoryId,
        ),
        appBar: backAppBar(context, "Sub Category"),
      ),
    );
  }
}

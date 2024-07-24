import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/managers/SubCategories%20Cubits/Delete%20SubCategory%20Cubit/delete_sub_category_cubit.dart';
import 'package:smart_auction/core/managers/SubCategories%20Cubits/Specific%20SubCategory%20Cubit/specific_sub_category_cubit.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Sub%20Categories/presentation/view/widgets/body_sub_category_page.dart';

class SubCategoryPage extends StatelessWidget {
  const SubCategoryPage(
      {super.key, required this.categoryId, required this.categoryName});
  final String categoryId;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SpecificSubCategoryCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteSubCategoryCubit(),
        ),
      ],
      child: Scaffold(
        body: BodySubCategoryPage(
          categoryId: categoryId,
          categoryName: categoryName,
        ),
        appBar: backAppBar(context, "Sub Category"),
      ),
    );
  }
}

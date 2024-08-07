import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/managers/SubCategories%20Cubits/Delete%20SubCategory%20Cubit/delete_sub_category_cubit.dart';
import 'package:smart_auction/feature/Categories%20Page/presentation/view/Widgets/body_cate_page.dart';

import '../../../../core/widgets/AppBar/back_app_bar.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteSubCategoryCubit(),
      child: Scaffold(
        appBar: backAppBar(context, "Category"),
        body: const BodyCategoryPage(),
      ),
    );
  }
}

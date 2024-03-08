import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/feature/Categories%20Page/presentation/manager/Fetch%20Categories/fetch_categories_cubit.dart';
import 'package:smart_auction/feature/Categories%20Page/presentation/view/Widgets/body_cate_page.dart';

import '../../../../core/widgets/AppBar/back_app_bar.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchCategoriesCubit(),
      child: Scaffold(
        appBar: backAppBar(context, "Category"),
        body: const BodyCategoryPage(),
      ),
    );
  }
}

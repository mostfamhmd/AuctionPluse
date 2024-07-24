import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/models/specific%20subcategory%20model/specific_subcategory_model.dart';
import 'package:smart_auction/core/widgets/AppBar/basic_app_bar.dart';
import 'package:smart_auction/feature/Add%20SubCategory/presentation/manager/Add%20Sub%20Category%20Cubit/add_sub_category_cubit.dart';
import 'package:smart_auction/feature/Add%20SubCategory/presentation/view/widgets/add_sub_category_body.dart';
import 'package:smart_auction/feature/Categories%20Page/presentation/manager/Fetch%20Categories/fetch_categories_cubit.dart';

import '../../../../core/widgets/Drawer/my_drawer.dart';

class AddSubCategoryView extends StatelessWidget {
  const AddSubCategoryView(
      {super.key,
      this.specificSubCategoryInfo,
      this.categoryName,
      this.categoryId});
  final SpecificSubCategoryInfo? specificSubCategoryInfo;
  final String? categoryName;
  final String? categoryId;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchCategoriesCubit(),
        ),
        BlocProvider(
          create: (context) => AddSubCategoryCubit(),
        ),
      ],
      child: Scaffold(
        appBar: basicAppBar(context, "Add a new subcategory"),
        body: AddSubCategoryBody(
          specificSubCategoryInfo: specificSubCategoryInfo,
          categoryId: categoryId,
          categoryName: categoryName,
        ),
        endDrawer: const MyDrawer(),
      ),
    );
  }
}

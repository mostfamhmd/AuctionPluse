import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/widgets/AppBar/basic_app_bar.dart';
import 'package:smart_auction/feature/Add%20Category/presentation/manager/AddCategoryCubit/add_category_cubit.dart';
import 'package:smart_auction/feature/Add%20Category/presentation/view/widgets/add_category_body.dart';
import 'package:smart_auction/feature/Categories%20Page/data/Model/category_model.dart';

import '../../../../core/widgets/Drawer/my_drawer.dart';

class AddCategoryView extends StatelessWidget {
  const AddCategoryView({super.key, this.category});
  final Category? category;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCategoryCubit(),
      child: Scaffold(
        appBar: basicAppBar(context, "Add a new category"),
        body: AddCategoryBody(
          category: category,
        ),
        endDrawer: const MyDrawer(),
      ),
    );
  }
}

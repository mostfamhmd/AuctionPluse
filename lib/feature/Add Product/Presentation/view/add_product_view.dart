import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/manager/AddProductCubit/add_product_cubit.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/add_product_body.dart';

import '../../../../core/widgets/AppBar/basic_app_bar.dart';
import '../../../../core/widgets/Drawer/my_drawer.dart';

class AddProductsView extends StatefulWidget {
  const AddProductsView({super.key});

  @override
  State<AddProductsView> createState() => _AddProductsViewState();
}

class _AddProductsViewState extends State<AddProductsView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(),
      child: Scaffold(
        appBar: basicAppBar(context, "Add a new product"),
        body: const AddProductBody(),
        endDrawer: const MyDrawer(),
      ),
    );
  }
}

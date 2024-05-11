import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/managers/UpdateProductCubit/update_product_cubit.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/manager/AddProductCubit/add_product_cubit.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/widgets/add_product_body.dart';

import '../../../../core/widgets/AppBar/basic_app_bar.dart';
import '../../../../core/widgets/Drawer/my_drawer.dart';

class AddProductsView extends StatelessWidget {
  const AddProductsView({super.key, this.productInfo});
  final ProductInfo? productInfo;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddProductCubit(),
        ),
        BlocProvider(
          create: (context) => UpdateProductCubit(),
        ),
      ],
      child: Scaffold(
        appBar: productInfo == null
            ? basicAppBar(context, "Add a new product")
            : basicAppBar(context, "update product"),
        body: AddProductBody(
          productInfo: productInfo,
        ),
        endDrawer: const MyDrawer(),
      ),
    );
  }
}

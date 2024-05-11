import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Famous%20Brands/presentation/manager/Get%20Brands%20Cubit/get_brands_cubit.dart';
import 'package:smart_auction/feature/Product%20Mangement/presentation/manager/Delete%20Specific%20Product%20Cubit/delete_specific_product_cubit.dart';
import 'package:smart_auction/feature/Product%20Mangement/presentation/manager/Get%20Admin%20Products%20Cubit/get_admin_products_cubit.dart';
import 'package:smart_auction/feature/Product%20Mangement/presentation/view/widgets/product_management_body.dart';
import 'package:smart_auction/feature/Sub%20Categories/presentation/view/manager/Fetch%20Sub%20Categories/fetch_sub_categories_cubit.dart';

class ProductManagementView extends StatelessWidget {
  const ProductManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DeleteSpecificProductCubit(),
        ),
        BlocProvider(
          create: (context) => GetAdminProductsCubit(),
        ),
        BlocProvider(
          create: (context) => GetBrandsCubit(),
        ),
        BlocProvider(
          create: (context) => FetchSubCategoriesCubit(),
        ),
      ],
      child: Scaffold(
        appBar: backAppBar(context, "Manage all Products"),
        body: const ProductManagementBody(),
      ),
    );
  }
}

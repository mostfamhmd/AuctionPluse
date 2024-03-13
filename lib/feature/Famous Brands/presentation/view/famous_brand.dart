import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/widgets/AppBar/basic_app_bar.dart';
import 'package:smart_auction/feature/Famous%20Brands/presentation/manager/Get%20Brands%20Cubit/get_brands_cubit.dart';
import 'package:smart_auction/feature/Famous%20Brands/presentation/view/widgets/body_famous_brands_page.dart';

import '../../../../core/widgets/Drawer/my_drawer.dart';

class FamousBrandsPage extends StatelessWidget {
  const FamousBrandsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetBrandsCubit(),
      child: Scaffold(
        appBar: basicAppBar(context, "Famous Brand"),
        body: const BodyFamousBrandsPage(),
        endDrawer: const MyDrawer(),
      ),
    );
  }
}

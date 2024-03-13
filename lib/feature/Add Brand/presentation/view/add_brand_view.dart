import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/widgets/AppBar/basic_app_bar.dart';
import 'package:smart_auction/feature/Add%20Brand/presentation/manager/Add%20Brand%20Cubit/add_brand_cubit.dart';
import 'package:smart_auction/feature/Add%20Brand/presentation/view/widgets/add_brand_body.dart';

import '../../../../core/widgets/Drawer/my_drawer.dart';

class AddBrandView extends StatelessWidget {
  const AddBrandView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddBrandCubit(),
      child: Scaffold(
        appBar: basicAppBar(context, "Add a new brand"),
        body: const AddBrandBody(),
        endDrawer: const MyDrawer(),
      ),
    );
  }
}

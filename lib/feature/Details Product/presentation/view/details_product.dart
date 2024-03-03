import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/widgets/AppBar/basic_app_bar.dart';
import 'package:smart_auction/core/widgets/Drawer/my_drawer.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/manager/Is%20Favorite/is_favorite_cubit.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/widgets/body_details_product.dart';

class DetailsProductPage extends StatelessWidget {
  const DetailsProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IsFavoriteCubit(),
      child: Scaffold(
        body: const BodyDetailsProductPage(),
        endDrawer: const MyDrawer(),
        appBar: basicAppBar(context, "iPhone 15 pro Max",),
      ),
    );
  }
}

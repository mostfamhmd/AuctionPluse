import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/widgets/AppBar/back_app_bar.dart';
import 'package:smart_auction/feature/Favorite%20Page/presentation/manager/Delete%20Product%20WhichListCubit/delete_favorite_product_cubit.dart';
import 'package:smart_auction/feature/Favorite%20Page/presentation/manager/WhichList%20Cubit/which_list_cubit.dart';
import 'package:smart_auction/feature/Favorite%20Page/presentation/view/widgets/body_favorite_page.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WhichListCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteFavoriteProductCubit(),
        ),
      ],
      child: Scaffold(
        body: const BodyFavoritePage(),
        appBar: backAppBar(context, "Favorite Product"),
      ),
    );
  }
}

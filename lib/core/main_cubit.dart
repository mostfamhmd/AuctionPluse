import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/managers/Get%20Products%20Cubit/get_products_cubit.dart';
import 'package:smart_auction/feature/Cart%20Page/presentation/manager/Get%20Cart%20Product%20Cubit/get_cart_product_cubit.dart';
import 'package:smart_auction/feature/Categories%20Page/presentation/manager/Fetch%20Categories/fetch_categories_cubit.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/manager/Add%20Product%20To%20Cart%20Cubit/add_product_to_cart_cubit.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/manager/Is%20Favorite/is_favorite_cubit.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/manager/Review%20Cubit/review_cubit.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/manager/Selected%20Color%20Cubit/selected_color_cubit.dart';
import 'package:smart_auction/feature/Famous%20Brands/presentation/manager/Get%20Brands%20Cubit/get_brands_cubit.dart';
import 'package:smart_auction/feature/Favorite%20Page/presentation/manager/Delete%20Product%20WhichListCubit/delete_favorite_product_cubit.dart';
import 'package:smart_auction/feature/Favorite%20Page/presentation/manager/WhichList%20Cubit/which_list_cubit.dart';
import 'package:smart_auction/feature/Login%20Page/presentation/manager/cubit/app_cubit_cubit.dart';
import 'package:smart_auction/feature/Reviews%20Of%20Products/presentation/manager/DeleteReviewCubit/delete_review_cubit.dart';
import 'package:smart_auction/feature/Reviews%20Of%20Products/presentation/manager/EditReviewCubit/edit_review_cubit.dart';
import 'package:smart_auction/feature/Sub%20Categories/presentation/view/manager/Fetch%20Sub%20Categories/fetch_sub_categories_cubit.dart';
import 'package:smart_auction/feature/Write%20Comments/presentation/manager/Add%20Comment%20Cubit/add_comment_cubit.dart';

class MainCubit extends StatelessWidget {
  const MainCubit({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchCategoriesCubit(),
        ),
        BlocProvider(
          create: (context) => GetBrandsCubit(),
        ),
        BlocProvider(
          create: (context) => GetProductsCubit(),
        ),
        BlocProvider(
          create: (context) => FetchSubCategoriesCubit(),
        ),
        BlocProvider(
          create: (context) => AppCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteFavoriteProductCubit(),
        ),
        BlocProvider(
          create: (context) => WhichListCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteReviewCubit(),
        ),
        BlocProvider(
          create: (context) => AddCommentCubit(),
        ),
        BlocProvider(
          create: (context) => EditReviewCubit(),
        ),
        BlocProvider(
          create: (context) => AddProductToCartCubit(),
        ),
        BlocProvider(
          create: (context) => IsFavoriteCubit(),
        ),
        BlocProvider(
          create: (context) => ColorCubit(),
        ),
        BlocProvider(
          create: (context) => ReviewCubit(),
        ),
        BlocProvider(
          create: (context) => DeleteReviewCubit(),
        ),
        BlocProvider(
          create: (context) => GetCartProductCubit(),
        ),
      ],
      child: child,
    );
  }
}
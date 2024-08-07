// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/core/widgets/Components/rating_widget.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/manager/Is%20Favorite/is_favorite_cubit.dart';
import 'package:smart_auction/feature/Favorite%20Page/presentation/manager/Delete%20Product%20WhichListCubit/delete_favorite_product_cubit.dart';

class RatingAndFavorite extends StatefulWidget {
  const RatingAndFavorite({
    super.key,
    required this.rating,
    required this.productId,
    this.isFavorite,
  });

  final num? rating;
  final String productId;
  final ValueNotifier<bool>? isFavorite;

  @override
  State<RatingAndFavorite> createState() => _RatingAndFavoriteState();
}

class _RatingAndFavoriteState extends State<RatingAndFavorite> {
  @override
  Widget build(BuildContext context) {
    return widget.isFavorite?.value == null
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RatingWidget(
                rating: widget.rating ?? 0,
              ),
            ],
          )
        : BlocListener<IsFavoriteCubit, IsFavoriteState>(
            listener: (context, state) {
              if (state is IsFavoriteSuccess) {
                widget.isFavorite!.value = true;
              } else if (state is IsFavoriteFailure) {
                myErrorSnackBar(context, state.serverFailure);
              }
            },
            child: BlocListener<DeleteFavoriteProductCubit,
                DeleteFavoriteProductState>(
              listener: (context, state) {
                if (state is DeleteProductWhichListSuccess) {
                  widget.isFavorite!.value = false;
                } else if (state is DeleteProductWhichListError) {
                  myErrorSnackBar(context, state.error);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingWidget(
                    rating: widget.rating ?? 0,
                  ),
                  ValueListenableBuilder(
                    valueListenable: widget.isFavorite!,
                    builder: (BuildContext context, value, Widget? child) =>
                        value == false
                            ? GestureDetector(
                                onTap: () {
                                  context
                                      .read<IsFavoriteCubit>()
                                      .addProduct(productId: widget.productId);
                                },
                                child: const Icon(
                                  Icons.favorite,
                                  color: AppColors.kGray,
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  context
                                      .read<DeleteFavoriteProductCubit>()
                                      .deleteProductWhichList(
                                          productId: widget.productId);
                                },
                                child: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              ),
                  ),
                ],
              ),
            ),
          );
  }
}

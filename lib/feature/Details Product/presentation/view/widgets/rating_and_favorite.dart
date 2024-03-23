// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/widgets/Components/rating_widget.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/manager/Is%20Favorite/is_favorite_cubit.dart';

class RatingAndFavorite extends StatefulWidget {
  const RatingAndFavorite({
    super.key,
    required this.rating,
  });

  final num? rating;

  @override
  State<RatingAndFavorite> createState() => _RatingAndFavoriteState();
}

class _RatingAndFavoriteState extends State<RatingAndFavorite> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RatingWidget(
          rating: widget.rating ?? 0,
        ),
        BlocBuilder<IsFavoriteCubit, IsFavoriteState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                isFavorite = !isFavorite;
                context.read<IsFavoriteCubit>().emit(IsFavoriteInitial());
              },
              child: Icon(
                Icons.favorite,
                color: isFavorite == true ? Colors.red : AppColors.kGray,
              ),
            );
          },
        ),
      ],
    );
  }
}

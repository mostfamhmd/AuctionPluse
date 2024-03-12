import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/fonts.dart';
import '../../../../../core/utils/styles.dart';
import '../../manager/Is Favorite/is_favorite_cubit.dart';

class NameProductFavorite extends StatefulWidget {
  const NameProductFavorite({super.key});

  @override
  State<NameProductFavorite> createState() => _NameProductFavoriteState();
}

class _NameProductFavoriteState extends State<NameProductFavorite> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "iPhone 15 pro Max",
          style: AppStyles.kPoppins700.copyWith(
            fontSize: 16.sp,
            fontFamily: AppFonts.kPoppins700,
          ),
        ),
        BlocBuilder<IsFavoriteCubit, IsFavoriteState>(
          builder: (context, state) {
            return GestureDetector(
              onTap: () {
                isFavorite = !isFavorite;
                // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
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

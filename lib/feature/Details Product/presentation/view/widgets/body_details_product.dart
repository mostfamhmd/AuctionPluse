import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Cart%20Page/presentation/manager/Get%20Cart%20Product%20Cubit/get_cart_product_cubit.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/manager/Review%20Cubit/review_cubit.dart';
import 'package:smart_auction/feature/Favorite%20Page/presentation/manager/WhichList%20Cubit/which_list_cubit.dart';

import 'info_product.dart';

class BodyDetailsProductPage extends StatefulWidget {
  const BodyDetailsProductPage(
      {super.key, required this.product, required this.userRole});
  final ProductInfo product;
  final String userRole;

  @override
  State<BodyDetailsProductPage> createState() => _BodyDetailsProductPageState();
}

class _BodyDetailsProductPageState extends State<BodyDetailsProductPage> {
  List<Color> colors = [];
  ValueNotifier<bool> isFavorite = ValueNotifier(false);
  // String userRole = "";

  // Future<String> getUserRole() async {
  //   userRole = await AppConsts.getData(AppConsts.kUserRole);
  //   setState(() {});
  //   return userRole;
  // }

  @override
  void initState() {
    for (int i = 0; i < widget.product.colors!.length; i++) {
      String hexColor = widget.product.colors![i];
      int colorValue = int.parse(hexColor.substring(1), radix: 16);
      int finalColorValue = 0xFF000000 + colorValue;
      Color color = Color(finalColorValue);
      colors.add(color);
    }
    context.read<ReviewCubit>().getAllReviews();

    context.read<GetCartProductCubit>().getCartProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.userRole == "admin"
        ? InfoProduct(
            infoProduct: widget,
            colors: colors,
            isFavorite: ValueNotifier(false),
          )
        : BlocBuilder<WhichListCubit, WhichListState>(
            builder: (context, state) {
              if (state is WhichListSuccess) {
                for (int i = 0; i < state.whichListModel.data!.length; i++) {
                  if (state.whichListModel.data![i].id == widget.product.id) {
                    isFavorite.value = true;
                  }
                }
                return InfoProduct(
                  infoProduct: widget,
                  colors: colors,
                  isFavorite: isFavorite,
                );
              } else if (state is WhichListLoading) {
                return const LoadingState();
              } else if (state is WhichListError) {
                return Center(child: FailureState(error: state.error));
              } else {
                return const LoadingState();
              }
            },
          );
  }
}

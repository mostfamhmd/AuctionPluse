import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/widgets/Components/my_big_btn.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/manager/Add%20Product%20To%20Cart%20Cubit/add_product_to_cart_cubit.dart';

class AddToCartBTN extends StatelessWidget {
  const AddToCartBTN(
      {super.key,
      required this.loading,
      required this.productId,
      required this.color});
  final ValueNotifier<bool> loading;
  final String productId;
  final String color;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddProductToCartCubit, AddProductToCartState>(
      listener: (context, state) {
        if (state is AddProductToCartSuccess) {
          mySnackBar(context, "${state.addedProductModel.message}");
          loading.value = false;
        } else if (state is AddProductToCartFailure) {
          mySnackBar(context, state.errMessage);
          loading.value = false;
        } else if (state is AddProductToCartLoading) {
          loading.value = true;
        } else {
          loading.value = false;
        }
      },
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ValueListenableBuilder(
          valueListenable: loading,
          builder: (BuildContext context, value, Widget? child) => value == true
              ? const LoadingState()
              : MyBigBTN(
                  nameBTN: "Add To Cart",
                  onTap: () {
                    if (color.isNotEmpty) {
                      context
                          .read<AddProductToCartCubit>()
                          .addProductToCart(productId: productId, color: color);
                    }
                    if (color.isEmpty) {
                      mySnackBar(context, "choose color");
                    }
                  },
                ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/managers/Get%20Products%20Cubit/get_products_cubit.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Cart%20Page/presentation/manager/Get%20Cart%20Product%20Cubit/get_cart_product_cubit.dart';

import 'cubit_body.dart';

class BodyCartPage extends StatefulWidget {
  const BodyCartPage({super.key});

  @override
  State<BodyCartPage> createState() => _BodyCartPageState();
}

class _BodyCartPageState extends State<BodyCartPage> {
  @override
  void initState() {
    context.read<GetCartProductCubit>().getCartProduct();
    context.read<GetProductsCubit>().getAllProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartProductCubit, GetCartProductState>(
      builder: (context, state) {
        if (state is GetCartProductLoading) {
          return const LoadingState();
        } else if (state is GetCartProductSuccess) {
          return CubitBody(
            getCartModel: state.getCartModel,
          );
        } else if (state is GetCartProductFailure) {
          if (state.serverFailure
              .contains("There is no cart for this user id : ")) {
            return const FailureState(
                error: "You do not have products in your cart");
          } else {
            return FailureState(error: state.serverFailure);
          }
        } else {
          return const FailureState(error: "Nothing to show");
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/managers/Get%20Products%20Cubit/get_products_cubit.dart';
import 'package:smart_auction/core/widgets/Components/my_big_btn.dart';
import 'package:smart_auction/core/widgets/Components/my_custom_suffix_field.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Cart%20Page/data/model/get_products_cart_model.dart';
import 'package:smart_auction/feature/Cart%20Page/presentation/manager/Get%20Cart%20Product%20Cubit/get_cart_product_cubit.dart';
import 'package:smart_auction/feature/Cart%20Page/presentation/view/widgets/swipe_to_delete.dart';
import 'package:smart_auction/feature/Cart%20Page/presentation/view/widgets/total_price.dart';
import 'package:smart_auction/feature/Payment%20Page/presentation/view/payment_page.dart';

import 'apply_btn.dart';

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
          return FailureState(error: state.serverFailure);
        } else {
          return const FailureState(error: "Nothing to show");
        }
      },
    );
  }
}

class CubitBody extends StatelessWidget {
  const CubitBody({
    super.key,
    required this.getCartModel,
  });
  final GetCartModel getCartModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            SwipeToDelete(
              getCartModel: getCartModel,
            ),
            SizedBox(
              height: 10.h,
            ),
            MyCustomSuffixField(
              myController: TextEditingController(),
              isIcon: false,
              textAlign: TextAlign.start,
              hintText: "Enter Cupon Code",
              widget: InkWell(
                onTap: () {},
                child: const ApplyBTN(),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            TotalPrice(
              totalPrice: getCartModel.data!.totalCartPrice.toString(),
            ),
            SizedBox(
              height: 40.h,
            ),
            MyBigBTN(
              nameBTN: "Check Out",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PaymentPage(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}

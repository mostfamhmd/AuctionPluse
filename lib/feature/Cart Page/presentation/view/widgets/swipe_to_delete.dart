// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:smart_auction/core/globals/glopals.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/feature/Cart%20Page/data/model/get_products_cart_model.dart';
import 'package:smart_auction/feature/Cart%20Page/presentation/manager/Delete%20Product%20Cart%20Cubit/delete_product_cart_cubit.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/details_product.dart';
import 'package:smart_auction/feature/Home/presentation/view/home_view.dart';

import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/icons.dart';
import 'buying_container.dart';

class SwipeToDelete extends StatefulWidget {
  const SwipeToDelete({
    super.key,
    required this.getCartModel,
  });

  final GetCartModel getCartModel;

  @override
  State<SwipeToDelete> createState() => _SwipeToDeleteState();
}

class _SwipeToDeleteState extends State<SwipeToDelete> {
  List<ProductInfo> cartProduct = [];
  @override
  void initState() {
    if (products.isNotEmpty) {
      for (int i = 0; i < widget.getCartModel.numOfCartItems!.toInt(); i++) {
        for (int j = 0; j < products.length; j++) {
          if (widget.getCartModel.data!.cartItems![i].product ==
              products[j].sId) {
            cartProduct.add(products[j]);
          }
        }
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.getCartModel.numOfCartItems,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Column(
        children: [
          BlocListener<DeleteProductCartCubit, DeleteProductCartState>(
            listener: (context, state) {
              if (state is DeleteProductCartSuccess) {
                Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                        pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secondaryAnimation) =>
                            HomeView(
                              currentIndex: 1,
                            )));
              } else if (state is DeleteProductCartError) {
                myErrorSnackBar(context, state.errorMessage);
              }
            },
            child: SwipeActionCell(
              key: ObjectKey(index),
              trailingActions: <SwipeAction>[
                SwipeAction(
                  backgroundRadius: 5.r,
                  widthSpace: 50.w,
                  icon: Center(
                    child: SvgPicture.asset(
                      AppIcons.kRemove,
                      colorFilter: const ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  onTap: (CompletionHandler handler) async {
                    await handler(true);
                    context.read<DeleteProductCartCubit>().deleteProductCart(
                          productCartId:
                              widget.getCartModel.data!.cartItems![index].sId!,
                        );
                  },
                  color: AppColors.kLightBlue,
                ),
              ],
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsProductPage(
                        product: cartProduct[index],
                      ),
                    ),
                  );
                },
                child: BuyingContainer(
                  index: index,
                  productInfo: cartProduct[index],
                  cartItem: widget.getCartModel.data!.cartItems![index],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}

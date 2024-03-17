import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smart_auction/core/managers/Get%20Products%20Cubit/get_products_cubit.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/fonts.dart';
import 'package:smart_auction/feature/Home/presentation/view/widgets/BestSeller/best_seller_body.dart';

class CubitBestSellerState extends StatefulWidget {
  const CubitBestSellerState({super.key});

  @override
  State<CubitBestSellerState> createState() => _CubitBestSellerStateState();
}

class _CubitBestSellerStateState extends State<CubitBestSellerState> {
  List<ProductInfo> products = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsCubit, GetProductsState>(
      builder: (context, state) {
        if (state is GetProductsLoading) {
          return Center(
            child: SpinKitThreeBounce(
              color: Colors.black,
              size: 24.w,
            ),
          );
        } else if (state is GetProductsSuccess) {
          products = state.productsModel.data!;
          products.sort((a, b) => b.price!.compareTo(a.price!));
          return BestSellerBody(
            products: products,
          );
        } else if (state is GetProductsFailure) {
          return Center(
            child: Text(
              state.error,
              style: TextStyle(
                  fontFamily: AppFonts.kPoppins700,
                  fontSize: 18.sp,
                  color: AppColors.kDarkBlue),
            ),
          );
        } else {
          return const Center();
        }
      },
    );
  }
}

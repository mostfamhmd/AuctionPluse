// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/widgets/Components/body_view_product.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/feature/Favorite%20Page/presentation/manager/Delete%20Product%20WhichListCubit/delete_favorite_product_cubit.dart';

import '../../../feature/Details Product/presentation/view/details_product.dart';
import '../../utils/colors.dart';

class GridViewForViewProduct extends StatefulWidget {
  const GridViewForViewProduct({
    super.key,
    this.widget,
    this.products,
    this.isDelete,
  });

  final Widget? widget;
  final List<ProductInfo>? products;
  final bool? isDelete;

  @override
  State<GridViewForViewProduct> createState() => _GridViewForViewProductState();
}

class _GridViewForViewProductState extends State<GridViewForViewProduct> {
  int? _indx;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 270.h,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 20.h,
      ),
      itemCount: widget.products?.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsProductPage(
                  product: widget.products![index],
                ),
              ),
            );
          },
          child: BlocListener<DeleteFavoriteProductCubit,
              DeleteFavoriteProductState>(
            listener: (context, state) {
              if (state is DeleteProdWhichListLoading) {
                if (_indx == index) {
                  myLoadingSnackBar(context, "Loading...");
                }
              } else if (state is DeleteProductWhichListSuccess) {
                if (_indx == index) {
                  widget.products!.remove(widget.products![_indx!]);
                  mySuccessSnackBar(
                      context, state.deletedProductwhichListModel.message!);
                }

                setState(() {});
              } else if (state is DeleteProductWhichListError) {
                if (_indx == index) {
                  myErrorSnackBar(context, state.error);
                }
              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: AppColors.kWhite,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(8, 8),
                    color: AppColors.kGray.withOpacity(0.2),
                    blurRadius: 15.r,
                    blurStyle: BlurStyle.normal,
                    spreadRadius: 2,
                  ),
                  BoxShadow(
                    offset: const Offset(-8, -8),
                    color: AppColors.kGray.withOpacity(0.2),
                    blurRadius: 15.r,
                    blurStyle: BlurStyle.normal,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: BodyViewProduct(
                imageUrl: widget.products![index].imageCover!,
                nameProduct: widget.products![index].name!,
                overPrice:
                    "${widget.products![index].price! - widget.products![index].discountedPrice!}",
                productPrice: "${widget.products![index].price!}",
                percentageOver:
                    "${(widget.products![index].discountedPrice! / widget.products![index].price! * 100).toStringAsPrecision(2)}",
                rating: widget.products![index].ratingsAverage ?? 0.0,
                isDelete: widget.isDelete ?? false,
                onTap: widget.isDelete == true
                    ? () {
                        context
                            .read<DeleteFavoriteProductCubit>()
                            .deleteProductWhichList(
                                productId: widget.products![index].id!);
                        _indx = index;
                      }
                    : () {},
              ),
            ),
          ),
        );
      },
    );
  }
}

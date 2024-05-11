import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/widgets/Components/manage_order_or_product.dart';
import 'package:smart_auction/core/widgets/Components/my_snack_bar.dart';
import 'package:smart_auction/feature/Add%20Product/Presentation/view/add_product_view.dart';
import 'package:smart_auction/feature/Famous%20Brands/data/model/get_brands_model.dart';
import 'package:smart_auction/feature/Product%20Mangement/presentation/manager/Delete%20Specific%20Product%20Cubit/delete_specific_product_cubit.dart';
import 'package:smart_auction/feature/Product%20mangement/presentation/view/product_mangement_view.dart';
import 'package:smart_auction/feature/Sub%20Categories/data/model/sub_category_model.dart';

class ListOfOrdersOrProducts extends StatefulWidget {
  const ListOfOrdersOrProducts(
      {super.key,
      required this.isEdit,
      this.adminProduct,
      this.getBrandsModel,
      this.subCategoriesModel});
  final bool isEdit;
  final List<ProductInfo>? adminProduct;
  final GetBrandsModel? getBrandsModel;
  final SubCategoriesModel? subCategoriesModel;

  @override
  State<ListOfOrdersOrProducts> createState() => _ListOfOrdersOrProductsState();
}

class _ListOfOrdersOrProductsState extends State<ListOfOrdersOrProducts> {
  List<String> brandName = [];
  List<String> subCategoryName = [];
  List<List<String>> listSubs = [];
  SubCategory? subCategory;
  @override
  void initState() {
    if (widget.getBrandsModel != null) {
      for (int i = 0; i < widget.adminProduct!.length; i++) {
        for (int j = 0; j < widget.getBrandsModel!.data!.length; j++) {
          if (widget.adminProduct![i].brand! ==
              widget.getBrandsModel!.data![j].sId) {
            brandName.add(widget.getBrandsModel!.data![j].name!);
          }
        }
      }
    }
    if (widget.subCategoriesModel != null) {
      for (int i = 0; i < widget.adminProduct!.length; i++) {
        for (int j = 0; j < widget.subCategoriesModel!.data!.length; j++) {
          for (int k = 0;
              k < widget.adminProduct![i].subcategories!.length;
              k++) {
            if (widget.adminProduct![i].subcategories![k] ==
                widget.subCategoriesModel!.data![j].sId) {
              subCategoryName.add(widget.subCategoriesModel!.data![j].name!);
            }
          }
          if (subCategoryName.isNotEmpty) {
            listSubs.add(subCategoryName);
            subCategoryName = [];
          }
        }
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteSpecificProductCubit, DeleteSpecificProductState>(
      listener: (context, delete) {
        if (delete is DeleteSpecificProductSuccess) {
          Navigator.pushReplacement(
            context,
            PageRouteBuilder(
              pageBuilder: (BuildContext context, Animation<double> animation,
                      Animation<double> secondaryAnimation) =>
                  const ProductManagementView(),
            ),
          );
          mySuccessSnackBar(context, delete.success);
        } else if (delete is DeleteSpecificProductFailure) {
          myErrorSnackBar(context, delete.error);
        } else if (delete is DeleteSpecificProductLoading) {
          myLoadingSnackBar(context, "Loading ...");
        } else {
          myLoadingSnackBar(context, "Some thing wrong");
        }
      },
      child: ListView.builder(
          itemCount: widget.adminProduct!.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return ManageOrderOrProduct(
              onPressedEdit: () {
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        AddProductsView(
                      productInfo: widget.adminProduct![index],
                    ),
                  ),
                );
              },
              onPressedRemove: () {
                context
                    .read<DeleteSpecificProductCubit>()
                    .deleteSpecificProduct(
                        productId: widget.adminProduct![index].id!);
              },
              urlLinkImage: widget.adminProduct![index].imageCover!,
              isEdit: widget.isEdit,
              productPrice: r"$" +
                  (widget.adminProduct![index].price! -
                          widget.adminProduct![index].discountedPrice!)
                      .toString(),
              productName: widget.adminProduct![index].name!,
              productBrand: brandName[index],
              productDescription: widget.adminProduct![index].description!,
              rating: widget.adminProduct![index].ratingsAverage ?? 0,
            );
          }),
    );
  }
}

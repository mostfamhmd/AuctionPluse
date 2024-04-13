import 'package:flutter/material.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/widgets/Components/manage_order_or_product.dart';
import 'package:smart_auction/feature/Famous%20Brands/data/model/get_brands_model.dart';
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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.adminProduct!.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return ManageOrderOrProduct(
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
        });
  }
}

// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Best%20Seller/presentation/view/widgets/drop_down.dart';
import 'package:smart_auction/feature/Categories%20Page/presentation/manager/Fetch%20Categories/fetch_categories_cubit.dart';

import '../../../../../core/widgets/Components/grid_view_for_view_product.dart';

class BodyBestSellerPage extends StatefulWidget {
  const BodyBestSellerPage({super.key, required this.productInfoList});
  final List<ProductInfo> productInfoList;

  @override
  State<BodyBestSellerPage> createState() => _BodyBestSellerPageState();
}

class _BodyBestSellerPageState extends State<BodyBestSellerPage> {
  ValueNotifier<List<ProductInfo>> _myProducts = ValueNotifier([]);
  List<ProductInfo> _myList = [];
  List<String> _catNames = [];
  ValueNotifier<bool> isDone = ValueNotifier<bool>(false);
  String? _selectedValue;
  @override
  void initState() {
    for (int i = 0; i < widget.productInfoList.length; i++) {
      _myProducts.value.add(widget.productInfoList[i]);
      _myList.add(widget.productInfoList[i]);
    }
    context.read<FetchCategoriesCubit>().getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FetchCategoriesCubit, FetchCategoriesState>(
      listener: (context, state) {
        if (state is FetchCategoriesSuccess) {
          for (int i = 0; i < state.getCategories.data!.length; i++) {
            _catNames.add(state.getCategories.data![i].name!);
          }
          isDone.value = true;
        } else if (state is FetchCategoriesFailed) {
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text("Error"),
              content: Text(state.error),
            ),
          );
        } else {
          isDone.value = false;
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 20.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${_myProducts.value.length} Results",
                    style: AppStyles.kPoppins700.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.kGray,
                    ),
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: isDone,
                    builder: (BuildContext context, bool value,
                            Widget? child) =>
                        value
                            ? DropDown(
                                items: _catNames
                                    .map(
                                      (String item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: AppStyles.kPoppins700.copyWith(
                                            fontSize: 13.sp,
                                            color: AppColors.kDarkBlue,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    )
                                    .toList(),
                                selectedValue: _selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedValue = value;
                                    getSpecificProducts();
                                  });
                                },
                              )
                            : const LoadingState(),
                  ),
                ],
              ),
            ),
            ValueListenableBuilder(
              valueListenable: _myProducts,
              builder: (BuildContext context, value, Widget? child) =>
                  value.isEmpty
                      ? const FailureState(error: "No Products Found")
                      : GridViewForViewProduct(
                          products: value,
                        ),
            ),
          ],
        ),
      ),
    );
  }

  getSpecificProducts() {
    _myProducts.value.clear();
    for (int i = 0; i < _myList.length; i++) {
      if (_selectedValue == _myList[i].category!.name) {
        _myProducts.value.add(_myList[i]);
      }
    }
  }
}

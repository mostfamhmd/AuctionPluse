// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/models/product%20model/product_model.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';
import 'package:smart_auction/feature/Details%20Product/presentation/view/details_product.dart';

class ListOfProducts extends StatelessWidget {
  ListOfProducts({
    super.key,
    required this.productsSearch,
  });
  late ValueNotifier<List<ProductInfo>> productsSearch;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: productsSearch,
      builder: (BuildContext context, value, Widget? child) => value.isNotEmpty
          ? Expanded(
              child: ListView.builder(
                itemCount: value.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                    left: 15.w,
                    top: 15.h,
                    right: 15.w,
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsProductPage(
                            product: value[index],
                          ),
                        ),
                      );
                    },
                    leading: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.7,
                      child: Text(
                        value[index].name!,
                        style: AppStyles.kPoppins400.copyWith(
                          fontSize: 15.sp,
                          color: AppColors.kBlack,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : const FailureState(error: ""),
    );
  }
}

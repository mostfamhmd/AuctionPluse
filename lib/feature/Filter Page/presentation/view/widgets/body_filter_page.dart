import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smart_auction/core/utils/colors.dart';
import 'package:smart_auction/feature/Filter%20Page/data/model/BuyingFormat/buying_format.dart';
import 'package:smart_auction/feature/Filter%20Page/data/model/ItemLocation/item_location.dart';
import 'package:smart_auction/feature/Filter%20Page/data/model/ShowOnly/show_only.dart';
import 'package:smart_auction/feature/Filter%20Page/presentation/view/widgets/price_range_container.dart';
import 'package:smart_auction/feature/Filter%20Page/presentation/view/widgets/type_text.dart';

import '../../../../../core/utils/styles.dart';
import '../../../data/model/Condition/condition_model.dart';
import '../../manager/Is Tapped Cubit/is_tapped_cubit.dart';
import 'filter_type_search.dart';
import 'min_max_row_range.dart';

class BodyFilterPage extends StatefulWidget {
  const BodyFilterPage({super.key});

  @override
  State<BodyFilterPage> createState() => _BodyFilterPageState();
}

class _BodyFilterPageState extends State<BodyFilterPage> {
  RangeValues values = const RangeValues(0, 20000);
  String formattedStartNumber = "0,0";
  String formattedEndNumber = "20000,0";
  final formatter = NumberFormat('#,###.##');
  TextStyle isSelected = AppStyles.kPoppins700.copyWith(
    fontSize: 14.sp,
    color: AppColors.kLightBlue,
  );
  TextStyle notSelected = AppStyles.kPoppins400.copyWith(
    fontSize: 14.sp,
    color: AppColors.kGray,
  );
  Color isSelectedColor = AppColors.kLightBlue.withOpacity(0.1);
  Color notSelectedColor = Colors.white;
  Color isSelectedBorder = AppColors.kLightBlue.withOpacity(0.1);
  Color notSelectedBorder = AppColors.kGray.withOpacity(0.5);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TypeText(kTypeText: "Price Range"),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PriceRangeContainer(priceRange: formattedStartNumber),
                PriceRangeContainer(priceRange: formattedEndNumber),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            RangeSlider(
              values: values,
              activeColor: AppColors.kLightBlue,
              inactiveColor: AppColors.kGray,
              max: 20000,
              min: 0,
              labels: RangeLabels(
                values.start.toString(),
                values.end.toString(),
              ),
              onChanged: (values) => setState(() {
                this.values = values;
                formattedStartNumber = formatter.format(values.start);
                formattedEndNumber = formatter.format(values.end);
              }),
            ),
            const MinMaxRowRange(
              kMax: "MAX",
              kMin: "MIN",
            ),
            SizedBox(
              height: 20.h,
            ),
            const TypeText(kTypeText: "Condition"),
            SizedBox(
              height: 20.h,
            ),
            BlocBuilder<IsTappedCubit, IsTappedState>(
              builder: (context, state) {
                return Wrap(
                  spacing: 4.0.w,
                  runSpacing: 4.0.h,
                  children: List.generate(
                    conditions.length,
                    (index) => GestureDetector(
                      onTap: () {
                        conditions[index].isSelected =
                            !conditions[index].isSelected;
                        context.read<IsTappedCubit>().emit(IsTappedInitial());
                      },
                      child: FilterTypeSearch(
                          border: Border.all(
                            color: conditions[index].isSelected == true
                                ? isSelectedBorder
                                : notSelectedBorder,
                          ),
                          colorBackGround: conditions[index].isSelected == false
                              ? notSelectedColor
                              : isSelectedColor,
                          typeFilterSearch: conditions[index].condition,
                          style: conditions[index].isSelected == true
                              ? isSelected
                              : notSelected),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            const TypeText(kTypeText: "Buying Format"),
            SizedBox(
              height: 20.h,
            ),
            BlocBuilder<IsTappedCubit, IsTappedState>(
              builder: (context, state) {
                return Wrap(
                  spacing: 4.0.w,
                  runSpacing: 4.0.h,
                  children: List.generate(
                    buyingFormat.length,
                    (index) => GestureDetector(
                      onTap: () {
                        buyingFormat[index].isSelected =
                            !buyingFormat[index].isSelected;
                        context.read<IsTappedCubit>().emit(IsTappedInitial());
                      },
                      child: FilterTypeSearch(
                          border: Border.all(
                            color: buyingFormat[index].isSelected == true
                                ? isSelectedBorder
                                : notSelectedBorder,
                          ),
                          colorBackGround:
                              buyingFormat[index].isSelected == false
                                  ? notSelectedColor
                                  : isSelectedColor,
                          typeFilterSearch: buyingFormat[index].buyingFormat,
                          style: buyingFormat[index].isSelected == true
                              ? isSelected
                              : notSelected),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            const TypeText(kTypeText: "Item Location"),
            SizedBox(
              height: 20.h,
            ),
            BlocBuilder<IsTappedCubit, IsTappedState>(
              builder: (context, state) {
                return Wrap(
                  spacing: 4.0.w,
                  runSpacing: 4.0.h,
                  children: List.generate(
                    itemLocation.length,
                    (index) => GestureDetector(
                      onTap: () {
                        itemLocation[index].isSelected =
                            !itemLocation[index].isSelected;
                        context.read<IsTappedCubit>().emit(IsTappedInitial());
                      },
                      child: FilterTypeSearch(
                          border: Border.all(
                            color: itemLocation[index].isSelected == true
                                ? isSelectedBorder
                                : notSelectedBorder,
                          ),
                          colorBackGround:
                              itemLocation[index].isSelected == false
                                  ? notSelectedColor
                                  : isSelectedColor,
                          typeFilterSearch: itemLocation[index].itemLocation,
                          style: itemLocation[index].isSelected == true
                              ? isSelected
                              : notSelected),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            const TypeText(kTypeText: "Show Only"),
            SizedBox(
              height: 20.h,
            ),
            BlocBuilder<IsTappedCubit, IsTappedState>(
              builder: (context, state) {
                return Wrap(
                  spacing: 4.0.w,
                  runSpacing: 4.0.h,
                  children: List.generate(
                    showOnly.length,
                    (index) => GestureDetector(
                      onTap: () {
                        showOnly[index].isSelected =
                            !showOnly[index].isSelected;
                        context.read<IsTappedCubit>().emit(IsTappedInitial());
                      },
                      child: FilterTypeSearch(
                          border: Border.all(
                            color: showOnly[index].isSelected == true
                                ? isSelectedBorder
                                : notSelectedBorder,
                          ),
                          colorBackGround: showOnly[index].isSelected == false
                              ? notSelectedColor
                              : isSelectedColor,
                          typeFilterSearch: showOnly[index].showOnly,
                          style: showOnly[index].isSelected == true
                              ? isSelected
                              : notSelected),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 40.h,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 50.h,
                color: AppColors.kLightBlue,
                child: Center(
                  child: Text(
                    "Apply",
                    style: AppStyles.kPoppins700.copyWith(
                      fontSize: 14.sp,
                      color: AppColors.kBlack,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

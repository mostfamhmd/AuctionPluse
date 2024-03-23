import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/drop_down_component.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';

class ChooseSubCategory extends StatelessWidget {
  const ChooseSubCategory(
      {super.key,
      required this.subCategoryName,
      this.valSubCat,
      this.onChanged,
      this.idCatSelected});
  final ValueNotifier<List<String>> subCategoryName;
  final String? valSubCat;
  final void Function(String?)? onChanged;
  final String? idCatSelected;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: subCategoryName,
      builder: (BuildContext context, value, Widget? child) => value.isNotEmpty
          ? DropDownComponent(
              value: valSubCat,
              onChanged: onChanged,
              hint: 'Select Sub Category',
              items: value
                  .map(
                    (String item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: AppStyles.kPoppins400.copyWith(
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                  .toList(),
            )
          : value.isEmpty && idCatSelected != null
              ? const FailureState(error: "create new sub category first")
              : value.isEmpty
                  ? const Center()
                  : const LoadingState(),
    );
  }
}

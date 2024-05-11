import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_auction/core/utils/styles.dart';
import 'package:smart_auction/core/widgets/Components/drop_down_component.dart';
import 'package:smart_auction/core/widgets/Components/my_states.dart';

class ChooseCategory extends StatelessWidget {
  const ChooseCategory(
      {super.key,
      required this.isLoadingCategory,
      this.valCat,
      this.onChanged,
      required this.categories,
      this.hintCategory});
  final ValueNotifier<bool> isLoadingCategory;
  final String? valCat;
  final void Function(String?)? onChanged;
  final List<String> categories;
  final String? hintCategory;
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isLoadingCategory,
      builder: (BuildContext context, value, Widget? child) => value == false
          ? DropDownComponent(
              hint: hintCategory,
              value: valCat,
              onChanged: onChanged,
              items: categories
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
          : const LoadingState(),
    );
  }
}
